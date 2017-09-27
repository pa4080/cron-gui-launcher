#!/bin/sh

chmod +x "$PWD/cron-gui-launcher.bash"

[ -d "$HOME/bin/" ] && echo '~/bin is already crated.'|| mkdir "$HOME/bin/"
[ -f  "$HOME/bin/cron-gui-launcher" ] && echo "The file is already there." || ln -s "$PWD/cron-gui-launcher.bash" "$HOME/bin/cron-gui-launcher"
