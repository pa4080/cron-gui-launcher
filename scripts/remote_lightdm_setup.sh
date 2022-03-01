#!/bin/bash

# @author       Spas Z. Spasov <spas.z.spasov@gmail.com>
# @license      https://www.gnu.org/licenses/gpl-3.0.html GNU General Public License, version 3
# @home         https://github.com/metalevel-tech/cron-gui-launcher
#
# @name         remote_lightdm_setup.sh
#
# @source       [Answer of mine at the question: How to run script in a new terminal after connecting to Ubuntu via SSH?](https://askubuntu.com/a/1040852/566421)
#               [Answer of mine at the question: How to type into the lightdm login screen from the command line?](https://askubuntu.com/a/1020804/566421)
#
# @description  This script will perform auto log-in of the current user into a desktop session via SSH session.
#               Currently this script is deprecated because nowadays versions of Ubuntu use 'gdm3' instead of 'lightdm' as it wad before Ubuntu 17.10.

main() {
    # If the file '/etc/lightdm/lightdm.conf' exists create a backup copy
    [[ -f /etc/lightdm/lightdm.conf ]] && mv /etc/lightdm/lightdm.conf{,.bak}

    # Create autologin configuration for the current $USER = $1
    echo -e "[Seat:*]\nautologin-user=${1}" > /etc/lightdm/lightdm.conf

    # Restart 'lightdm' while autologin option is enabled
    systemctl restart lightdm.service

    # Wait for a moment to complete the login process and remove the conf file
    sleep 30 && rm /etc/lightdm/lightdm.conf

    # Restore the backup if exists
    [[ -f /etc/lightdm/lightdm.conf.bak ]] && mv /etc/lightdm/lightdm.conf{.bak,}
}

# Execute the 'main()' function with root privileges in the background 'sudo -b'
# Pass the curent $USER as arg (https://unix.stackexchange.com/a/269080/201297)
sudo -b bash -c "$(declare -f main); main ${USER}"