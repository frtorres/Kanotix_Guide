#!/bin/sh
if [ "$(id -u)" != "0" ]; then
 echo "Error: Run the script as root!" >&2
 exit 1
fi

# -----------
echo -n $0:
#
# ------------
echo starting dependencies kodi install process...
echo -n this is:
cat /etc/kanotix-version
read dummy
apt-get update
apt-get dist-upgrade
apt-get install git ranger kodi

