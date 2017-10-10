# cron-gui-launcher

A simple Bash script, that is able to launch a **GUI** application as **Cron** job within **Ubuntu**. The script is designed to work with the user's environment, respectively the Cron jobs shall be set within user's `crontab` file. It codld be modified to work with `cron.d`, but in some cases this will cause mishmash with the file permissions within `/proc`, so it is not good idea. 

## Input Parameters

- `$1` - list of commands to be executed.
- `$2` - short description of the job that will be appended to the log file name.
- `$3` - timeout in minutes, when the user is not logged in.

## How it works?

0. Note about the logging: The script will create a log file located in `/tmp`, which name shall be 
	````bash
	$USER-cron-gui-launcher-$DESCRIPTION.log
	````

     - Where as `$DESCRIPTION` will be assigned the value of the input variable `$2`, thus if you wish you can make some job's log file unique.

1. Initially the script attempts to get the current user's `$DISPLAY` number. For this purpose it uses the <a href="https://askubuntu.com/a/744751/566421">following</a> method:

	````bash
	w $(id -un) | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $3; exit}'
	````
   
   - The `$DISPLAY` variable is `unset` `while` the user is not logged in. In this case the scipt `sleep`'s for a while and then makes a new attept.
   
   - This action is repeated until the `$DISPLAY` variable is set, then its value is saved and exported. 

2. Create an array of the values of the envvar `$XDG_CURRENT_DESKTOP` from each <a href="http://manpages.ubuntu.com/manpages/trusty/man5/proc.5.html">`/proc/$ProcessNumber/environ`</a> file. The command `pgrep -U "$UID"` creates a list of all `$USER`'s processes. The function `get_environ()` is executed for each `$USER`'s process and its output is stored into the temporal array `XDG_CURRENT_DESKTOP+=$()`.

3. Get the name of the current Desktop Environment. Get the most frequent value from the array created in step 2. This is the way, used here, to find the current DE when it is changed a little bit ago. The function `get_frequent()` is used here and its output is stored as value of the variable `$XDG_CURRENT_DESKTOP`.

4. Filter the value of the variable `$XDG_CURRENT_DESKTOP` and set the result as value of the triger `$DE`.

5. Export the current user's desktop-session environment variables. The commands as `pgrep gnome-session -n -U $UID` gets the current user's desktop-session process number, then the function `export_environ()` reads the content of `/proc/$ProcessNumber/environ` and export its content line by line.

6. Execute the list of the input commands. Fragmentation of the list of the input commands (input variable "$1"), use ` && ` as separator, then execute each one by the function `execute_input_commands()`.

## Supported/Tested Desktop Environments

	
	unity | gnome | gnome-classic 	[Ubuntu Unity] [Ubuntu Gnome] [Gnome Classic] [Open Box]
	lxde				[Lubuntu] [Lubuntu Netbook] [LXDE]
	kde				[Kubuntu] [KDE Plasma]
	xfce | xfce4			[Xubuntu] [XFCE] [XFCE4]
	x-cinnamon			[Cinnamon] [Cinnamon2d]
	mate 				[MATE] [Open Box]
	


