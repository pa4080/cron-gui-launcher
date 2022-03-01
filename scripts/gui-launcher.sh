#!/bin/bash -e

# @author       Spas Z. Spasov <spas.z.spasov@gmail.com>
# @license      https://www.gnu.org/licenses/gpl-3.0.html GNU General Public License, version 3
# @home         https://github.com/metalevel-tech/cron-gui-launcher
#
# @name         gui-launcher.sh

# Check whether the user is logged-in
while [[ -z "$(/usr/bin/pgrep gnome-session -n -U $UID)" ]]; do sleep 3; done

# Export the current desktop session environment variables
# Sometimes it try to change $UID so we must remove -e option at the shebang or use 2>/dev/null here
export $(/usr/bin/xargs -0 -a "/proc/$(/usr/bin/pgrep gnome-session -n -U $UID)/environ") 2>/dev/null

# Execute the input command
/usr/bin/nohup "$@" >/dev/null 2>&1 &

exit 0