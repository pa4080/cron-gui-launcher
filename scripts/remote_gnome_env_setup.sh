#!/bin/bash

# @author       Spas Z. Spasov <spas.z.spasov@gmail.com>
# @license      https://www.gnu.org/licenses/gpl-3.0.html GNU General Public License, version 3
# @home         https://github.com/metalevel-tech/cron-gui-launcher
#
# @name         gui-launcher.sh
#
# @description  This script is designed to help me to easy setup my Ubuntu/Gnnome instances.

# xRDP session tweaks: fix ugly icons, https://c-nergy.be/blog/?p=12155
gsettings set org.gnome.shell disable-user-extensions false
gnome-extensions enable ubuntu-dock@ubuntu.com
gnome-extensions enable ubuntu-appindicators@ubuntu.com
gnome-extensions enable desktop-icons@csoriano
gnome-extensions enable dash-to-panel@jderose9.github.com
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru'
gsettings set org.gnome.desktop.interface icon-theme 'Yaru'
gsettings set org.gnome.desktop.wm.preferences button-layout ':minimize,maximize,close,'
gsettings set org.gnome.SessionManager auto-save-session true
gsettings set org.gnome.Terminal.Legacy.Settings new-terminal-mode 'tab'
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height true
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 28
gsettings set org.gnome.shell.extensions.dash-to-dock transparency-mode 'DYNAMIC'
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
gsettings set org.gnome.shell.extensions.desktop-icons icon-size 'small'

# Restart Pulseaudio and minimise RealVNC window
sleep 1 && /usr/bin/pulseaudio -k
sleep 7 && /usr/bin/xdotool windowminimize $(xdotool search --name "VNC Server" | tail -1)
sleep 1 && /usr/bin/pulseaudio -k
#sleep 1 && /usr/bin/xdg-screensaver lock

