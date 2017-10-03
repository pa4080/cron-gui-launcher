# cron-gui-launcher

A simple Bash script, that is able to launch any GUI application as Cron job within Ubuntu.

## Input Parameters

- `$1` - list of commands to be executed.
- `$2` - short description of the job that will be appended to the log file name.
- `$3` - timeout in minutes, when the user is not logged in.

## How it works?

0. Note about the logging: The script will create a log file located in `/tmp`, which name shall be `$USER-cron-gui-launcher-$DESCRIPTION.log`. Where as `$DESCRIPTION` will be assigned the value of the input variable `$2`, thus if you wish you can make some job's log file unique.

1. Initially the script attempts to get the current user's `$DISPLAY` number. For this purpose it uses the <a href="https://askubuntu.com/a/744751/566421">following</a> method:

	````bash
	w $(id -un) | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $3; exit}'
	````
   
   - The `$DISPLAY` variable is `unset` `while` the user is not logged in. In this case the scipt `sleep`'s for a while and then makes a new attept.
   
   - This action is repeated until the `$DISPLAY` variable is set, then its value is saved and exported. 

2. Create an array of the values of the envvar `$XDG_CURRENT_DESKTOP` from each `/proc/$ProcessNumber/environ` file. The command `pgrep -U "$UID"` creates a list of all `$USER`'s processes. The function `get_environ()` is executed for each process `$USER`'s process and its output is stored into the temporal array `XDG_CURRENT_DESKTOP+=$()`.

3. Get the name of the current Desktop Environment. Get the most frequent value from the array created in step 2. This is the way, used here, to find the current DE when it is changed a little bit ago. The function `get_frequent()` is used here and its output is stored as value of the variable `$XDG_CURRENT_DESKTOP`.

4. Filter the value of the variable `$XDG_CURRENT_DESKTOP` and set the result as value of the triger `$DE`.

5.

6.

## Supported/Tested Desktop Environments

	
	unity | gnome | gnome-classic 	[Ubuntu Unity] [Ubuntu Gnome] [Gnome Classic] [Open Box]
	lxde				[Lubuntu] [Lubuntu Netbook] [LXDE]
	kde				[Kubuntu] [KDE Plasma]
	xfce | xfce4			[Xubuntu] [XFCE] [XFCE4]
	x-cinnamon			[Cinnamon] [Cinnamon2d]
	mate 				[MATE] [Open Box]
	


