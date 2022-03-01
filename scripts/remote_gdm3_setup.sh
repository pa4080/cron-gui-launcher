#!/bin/bash

# @author       Spas Z. Spasov <spas.z.spasov@gmail.com>
# @license      https://www.gnu.org/licenses/gpl-3.0.html GNU General Public License, version 3
# @home         https://github.com/metalevel-tech/cron-gui-launcher
#
# @name         remote_gdm3_setup.sh

# The script should be run as root - using 'sudo' at each command is better in this case!
# [[ "$EUID" -ne 0 ]] && { echo "Please run as root (use sudo)."; exit 0; }

SEC_TO_SLEEP='3'

if   [[ ${1^^} =~ VNC|LOGIN|LOG-IN ]]
then
	sudo sed -r 's/^#(AutomaticLoginEnable=True)$/\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^(AutomaticLoginEnable=False)$/#\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^(WaylandEnable=false)$/#\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^(DefaultSession=gnome-xorg.desktop)$/#\1/' /etc/gdm3/custom.conf -i
	
	grep -P 'AutomaticLoginEnable|WaylandEnable|DefaultSession' /etc/gdm3/custom.conf

	#[[ -f ${HOME}/bin/cron-gui-launcher.sh ]] && ${HOME}/bin/cron-gui-launcher.sh 'gnome-session-quit --no-prompt' "log-out" "1"
	sleep "$SEC_TO_SLEEP" && sudo systemctl restart gdm3.service
	sleep "$SEC_TO_SLEEP" && sudo systemctl restart display-manager
elif [[ ${1^^} =~ RDP|LOGOUT|LOG-OUT ]]
then
	sudo sed -r 's/^(AutomaticLoginEnable=True)$/#\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^#(AutomaticLoginEnable=False)$/\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^(WaylandEnable=false)$/#\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^(DefaultSession=gnome-xorg.desktop)$/#\1/' /etc/gdm3/custom.conf -i
	
	grep -P 'AutomaticLoginEnable|WaylandEnable|DefaultSession' /etc/gdm3/custom.conf

	#[[ -f ${HOME}/bin/cron-gui-launcher.sh ]] && ${HOME}/bin/cron-gui-launcher.sh 'gnome-session-quit --no-prompt' "log-out" "1"
	sleep "$SEC_TO_SLEEP" && sudo systemctl restart gdm3.service
	sleep "$SEC_TO_SLEEP" && sudo systemctl restart display-manager
elif [[ ${1^^} =~ LOCK|LOCKSCREEN|LOCK-SCREEN ]]
then
	# sudo sed -r 's/^(AutomaticLoginEnable=True)$/#\1/' /etc/gdm3/custom.conf -i
	# sudo sed -r 's/^#(AutomaticLoginEnable=False)$/\1/' /etc/gdm3/custom.conf -i
	# sudo sed -r 's/^#(WaylandEnable=false)$/\1/' /etc/gdm3/custom.conf -i
	# sudo sed -r 's/^#(DefaultSession=gnome-xorg.desktop)$/\1/' /etc/gdm3/custom.conf -i

	sudo sed -r 's/^#(AutomaticLoginEnable=True)$/\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^(AutomaticLoginEnable=False)$/#\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^(WaylandEnable=false)$/#\1/' /etc/gdm3/custom.conf -i
	sudo sed -r 's/^(DefaultSession=gnome-xorg.desktop)$/#\1/' /etc/gdm3/custom.conf -i

	grep -P 'AutomaticLoginEnable|WaylandEnable|DefaultSession' /etc/gdm3/custom.conf

	#[[ -f ${HOME}/bin/cron-gui-launcher.sh ]] && ${HOME}/bin/cron-gui-launcher.sh 'gnome-session-quit --no-prompt' "log-out" "1"
	sleep "$SEC_TO_SLEEP" && sudo systemctl restart gdm3.service
	sleep "$SEC_TO_SLEEP" && sudo systemctl restart display-manager

	#sleep "$SEC_TO_SLEEP" && [[ -f ${HOME}/bin/cron-gui-launcher.sh ]] && ${HOME}/bin/cron-gui-launcher.sh 'xdg-screensaver lock' 'screen-lock' '2'
	sleep "$SEC_TO_SLEEP" && 'xdg-screensaver lock'
else
	echo "Arguments: (vnc|login)|(rdp|logout)|(lock|lockscreen)"
	exit 1
fi



