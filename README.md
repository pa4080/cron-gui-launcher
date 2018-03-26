# Cron-GIU-Launcher

**Cron-GIU-Launcher** is a simple Bash script, that is able to launch a **GUI** application as **Cron** job within **Ubuntu**. The script is designed to work with the user's environment, respectively the Cron jobs shall be set within user's `crontab` file. It codld be modified to work with `cron.d`, but in some cases this will cause mishmash with the file permissions within `/proc`, so it is not good idea. 

## Input Parameters

- `$1` - list of commands to be executed. The individual commands need to be separated with `␣&&␣` - note the spaces.
- `$2` - short description of the job that will be appended to the log file name. Read the the section *How it works?*
- `$3` - time-out in minutes, when the user is not logged in. While this variable is empty there is no time-out. If the job is on `@reboot` this variable should be empty. This option is usefull for regular Cron jobs, for example: If you have a job that is executed every 15 minutes and your user is logout (or locked) for 2 hours there will have 8 pending jobs, which will be execited when the user is logged on.

## How to use Cron-GIU-Launcher

Befor crating a Cron job that uses Cron-GIU-Launcher with Cron

## How to install

## How it works

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

3. Get the name of the current Desktop Environment. <a href="https://stackoverflow.com/questions/43440425/most-frequent-element-in-an-array-bash-3-2">Get the most frequent value from the array</a> created in step 2. This is the way, used here, to find the current DE when it is changed a little bit ago. The function `get_frequent()` is used here and its output is stored as value of the variable `$XDG_CURRENT_DESKTOP`.

4. Filter the value of the variable `$XDG_CURRENT_DESKTOP` and set the result as value of the triger `$DE`.

5. Export the current user's desktop-session environment variables. The commands as `pgrep gnome-session -n -U $UID` gets the current user's desktop-session process number, then the function `export_environ()` reads the content of `/proc/$ProcessNumber/environ` and export its content line by line.

6. Execute the list of the input commands. Fragmentation of the list of the input commands (input variable "$1"), use ` && ` as separator, then execute each one by the function `execute_input_commands()`.

## Supported/Tested Desktop Environments

	$(pgrep gnome-session -n -U $UID)	[Ubuntu Unity] [Ubuntu Gnome Desktopt] [Gnome Classic | Flashbach (compis|metacity)] (Openbox) [Budgie]
	$(pgrep gnome-session-b -n -U $UID) 	This the full name of the proccess!
	$(pgrep budgie-daemon -n -U $UID)	[Budgie] but $(pgrep gnome-session -n -U $UID) is better choice
	$(pgrep xfce4-session -n -U $UID)	[Xubuntu] [XFCE4]
	$(pgrep mate-session -n -U $UID)	[Ubuntu MATE] (Openbox)
	$(pgrep lxsession -n -U $UID)		[Lubuntu] [Lubuntu Netbook] [LXDE]
	$(pgrep lxqt-session -n -U $UID)	[LXQt]
	$(pgrep cinnamon-sessio -n -U $UID)	[Cinnamon] [Cinnamon2d] [Cinnamon (Software Rendering)]
	$(pgrep startkde -n -U $UID)		[Kubuntu] [KDE Plasma] (Openbox)
	$(pgrep start-lumina-de -n -U $UID)	[Lumina]  (The Lumina® Desktop Environment)
	$(pgrep fluxbox -n -U $UID)		[Fluxbox] (The Lumina® Desktop Environment)
	$(pgrep xmonad -n -U $UID)		[Xmonad]
	$(pgrep subtle -n -U $UID)		[Subtle]
	$(pgrep awesome -n -U $UID)		[Awesome]
	$(pgrep enlightenment -n -U $UID)	[Enlightenment]
	$(pgrep i3bar -n -U $UID)		[i3wm]
	$(pgrep openbox -n -U $UID)		[Openbox] [GNOME/Openbox KDE/Openbox]
	$(pgrep starttde -n -U $UID)		[Trinity]
		
## Origins

- [How to launch any GUI related application from crontab in Ubuntu 16.04, 17.10 and other Ubuntu distros with Gnome](https://askubuntu.com/questions/978382/how-can-i-show-notify-send-messages-triggered-by-crontab/978413#978413)
- [Cannot change desktop background with crontab on Lubuntu](https://askubuntu.com/a/1019449/566421)
- [How do I split a “/proc/*/environ” file in separate lines?](https://askubuntu.com/questions/978711/how-do-i-split-a-proc-environ-file-in-separate-lines)
- [How to determine which is the current user's DE through CLI within SSH or Cron?](https://askubuntu.com/questions/956664/how-to-determine-which-is-the-current-users-de-through-cli-within-ssh-or-cron)
- [Cron job to run python script at reboot does not work](https://askubuntu.com/questions/970771/cron-job-to-run-python-script-at-reboot-does-not-work)
- [Adjust brightness with xrandr and cron job](https://askubuntu.com/questions/958228/adjust-brightness-with-xrandr-and-cron-job)
- [Crontab and C program that should be executed into a terminal window](https://askubuntu.com/questions/955582/crontab-and-c-program-that-should-be-executed-into-a-terminal-window)
- [Why does this cronjob not work? (Daily-Reddit-Wallpaper)](https://askubuntu.com/questions/911570/why-does-this-cronjob-not-work)
