#!/bin/bash

# [0.] Create log file. Use "$2" to leave a description within the name.
if [[ -z "${2+x}" ]]; then DESCRIPTION=""; else DESCRIPTION="$2"; fi
LOG="/tmp/$USER-cron-gui-launcher-${DESCRIPTION}.log"
printf '\n%s\n\n\nDetected environment variables:\n\n' "$(date +%Y-%m-%d_%H:%M:%S)" > "$LOG"

# [1.] Get the value of the $DISPLAY variable for the current user. Unset it just in case this is a `ssh -X` connection
unset DISPLAY; timeout=0

while [[ -z "$DISPLAY" ]]; do
        DISPLAY=$(w -h "$USER" | awk 'NF > 0 && $2 ~ /tty[0-9]+|^:/ {print $3; exit}' 2>/dev/null)

        if [[ "$DISPLAY" == "" ]]
        then
                XRDP_DISPLAY=$(ps -ef | grep -oP '/usr/lib/xorg/Xorg :[0-9]+ -auth .Xauthority.*log$' | grep -oP ':[0-9]+')

                if [[ "$XRDP_DISPLAY" != "" ]]
                then
                        export DISPLAY="${XRDP_DISPLAY}.0"
                else
                        sleep 30 && ((timeout++))

                        if [[ ! -z "${3+x}" ]] && [[ "$timeout" -eq "$3" ]]
                        then
                                printf "Timeout: %s\n" "$timeout" >> "$LOG"
                                exit 1
                        fi
                fi
        else
                export DISPLAY="$DISPLAY"
        fi
done

printf 'DISPLAY=%s\n' "$DISPLAY" >> "$LOG"

# [->2.] Get certain envvar value ("$1") from any "/proc/$ProcessNumber/environ" file ("$2")
# https://stackoverflow.com/questions/46163678/get-rid-of-warning-command-substitution-ignored-null-byte-in-input
get_environ(){
        EnvVar=$(sed -zne "s/^$1=//p" "/proc/$2/environ" 2>/dev/null | tr -d '\0'); printf "%s" "$EnvVar";
}

# [->3.] Get the most frequent value from an array - https://stackoverflow.com/a/43440769/6543935
get_frequent(){
        awk 'BEGIN{ FS=" " } { for(i=1;i<=NF;i++) print $i }' | \
        awk '{ n=++hsh[$1]; if(n>max_occ){ max_occ=n; what=$1 } else if(n==max_occ){ if(what>$1) what=$1 } } END{ print what }'
}

# [->5.] Get the conten ot the current-desktop-session's environment file as an array, then export each line
export_environ(){
        printf '\n\nExported environment (source file /proc/%s/environ):\n\n' "$1" >> "$LOG"

        EnvVarList=$(cat -e "/proc/$1/environ" 2>/dev/null | sed 's/\^@/\n/g' | tr -d '\0')

        for EnvVar in $EnvVarList
        do
                echo "export $EnvVar" >> "$LOG"
                export "$EnvVar" 2>/dev/null
        done
}

# [->6.] Fragmentation of the list of the input commands (input variable "$1"), use ` && ` as separator, then execute each one
execute_input_commands(){
        printf "%s" "$1" | awk 'BEGIN{ FS=" && "; print "\nInput command list:" } {for(i=1;i<=NF;i++) system("echo \"Command: " $i "\"") system("nohup " $i " >/dev/null 2>&1 &")}' >> "$LOG"
}

# [2.] Get the value of $XDG_CURRENT_DESKTOP from each "/proc/$ProcessNumber/environ" file - create an array.
for PN in $(pgrep -U "$UID")
do
        XDG_CURRENT_DESKTOP+=$(get_environ "XDG_CURRENT_DESKTOP" "$PN"; echo " ")
done

# [3.] Get the name of the current Desktop Environment
XDG_CURRENT_DESKTOP=$(echo -e "${XDG_CURRENT_DESKTOP[@]}" | get_frequent)

# [4.] Set the triger $DE - declare it in lowercase, then cut `:something` and export
declare -l DE && export DE="${XDG_CURRENT_DESKTOP/:*/}" && printf 'XDG_CURRENT_DESKTOP=%s\nDE=%s\n' "$XDG_CURRENT_DESKTOP" "$DE" >> "$LOG"

# [5.] Export the Current-Desktop-Session Environment Variables:
if   [[ "$DE" == "unity" ]];               then export_environ "$(pgrep gnome-session -n -U $UID)"
elif [[ "$DE" == "gnome" ]];               then export_environ "$(pgrep gnome-session -n -U $UID)"
elif [[ "$DE" == "gnome-classic" ]];       then export_environ "$(pgrep gnome-session -n -U $UID)"
elif [[ "$DE" == "kde" ]];                 then export_environ "$(pgrep startkde -n -U $UID)"
elif [[ "$DE" == "mate" ]];                then export_environ "$(pgrep mate-session  -n -U $UID)"
elif [[ "$DE" == "lxde" ]];                then export_environ "$(pgrep lxsession -n -U $UID)"
elif [[ "$DE" == "xfce" ]];                then export_environ "$(pgrep xfce4-session -n -U $UID)"
elif [[ "$DE" == "xfce4" ]];               then export_environ "$(pgrep xfce4-session -n -U $UID)"
elif [[ "$DE" == "x-cinnamon" ]];          then export_environ "$(pgrep cinnamon-session -n -U $UID)"
else printf 'Your current Desktop Environment is not supported!\n Please contribute to https://github.com/metalevel-tech/cron-gui-launcher\n' >> "$LOG"
fi

# [6.] Execute the list of the input commands
if [[ -z "${1+x}" ]]; then
        printf '\n\nThere is not any input command!\n'
else
        execute_input_commands "$1"
fi

# Debug cat "$LOG"
