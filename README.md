# cron-gui-launcher

A simple Bash script, that is able to launch any GUI application as Cron job within Ubuntu.

## Input Parameters

- `$1` - list of commands to be executed.
- `$2` - short description of the job that will be appended to the log file name.
- `$3` - timeout in minutes, when the user is not logged in.

## How it works?

0. Note about the logging: The sctipt will create a log file, located in `/tmp`, which name shall be `$USER-git-cron-launcher-$DESCRIPTION.log`. Where as `$DESCRIPTION` will be asignet the value of the input variable `$2`, thus if you wish you can make some job's log file unique.

1. Initiallyt the scrypt attempt to get the current user's `$DISPLAY` number. For this purposse it uses the <a href="https://askubuntu.com/a/744751/566421">following</a> method: 

	````bash
	w $(id -un) | awk 'NF > 7 && $2 ~ /tty[0-9]+/ {print $3; exit}'
	````
   
   - The `$DISPLAY` variable is `unset` `while` the user is not logged in. In this case the scipt `sleep`'s for a while and then makes a new attept.
   - This action is repeated until the `$DISPLAY` variable is set and its value is getted and exportedexported.


## Supported/Tested Desktop Environments

	
	unity | gnome | gnome-classic 	[Ubuntu Unity] [Ubuntu Gnome] [Gnome Classic] [Open Box]
	lxde				[Lubuntu] [Lubuntu Netbook] [LXDE]
	kde				[Kubuntu] [KDE Plasma]
	xfce | xfce4			[Xubuntu] [XFCE] [XFCE4]
	x-cinnamon			[Cinnamon] [Cinnamon2d]
	mate 				[MATE] [Open Box]
	


