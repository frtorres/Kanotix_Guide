#!/bin/sh

SCR_LOC=https://raw.githubusercontent.com/frtorres/Kanotix_Guide/master/droid-scripts/
SCR_PRF=droid*sh

#if test $(id -u) != 0; then
# echo Error: You must be root to run this script!
# exit 1
#fi

for script in droid*sh; do
 echo -n $script...
 if wget -N $SCR_LOC$script >/dev/null 2>&1; then
  echo current version
 else
  echo no update available
 fi
done

