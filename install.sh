#!/bin/sh

chmod +x "$PWD/cron-gui-launcher.bash"

if [ ! -d "$HOME/bin/" ]; then mkdir "$HOME/bin/"; fi
if [ ! -L "$HOME/bin/cron-gui-launcher" ]; then cp "$PWD/cron-gui-launcher.bash" "$HOME/bin/cron-gui-launcher"; fi
#if [ ! -L "$HOME/bin/cron-gui-launcher" ]; then ln -s "$PWD/cron-gui-launcher.bash" "$HOME/bin/cron-gui-launcher"; fi
