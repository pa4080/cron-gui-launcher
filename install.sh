#!/bin/sh

chmod +x cron-gui-launcher
[ -d "$HOME/bin/" ] || mkdir "$HOME/bin/" 
[ -f  "$HOME/bin/cron-gui-launcher" ] || ln -s "$PWD/cron-gui-launcher.bash" "$HOME/bin/cron-gui-launcher"
