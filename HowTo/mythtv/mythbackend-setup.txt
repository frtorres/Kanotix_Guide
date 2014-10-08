[ "$(id -u)" = 0 ] || exit 1

if [ -f /etc/init.d/mythbackend ]; then
 echo myhtbackend already exist, nothing done exiting.
 exit 1
fi

echo setting up mythbackend...
LOGDIR=/var/log/mythtv

cat > /etc/init.d/mythbackend <<EOF
##############################################################################
#! /bin/sh
#
# mythtv-server MythTV capture and encoding backend
#
# Based on:
#
# skeleton      example file to build /etc/init.d/ scripts.
#               This file should be used to construct scripts for /etc/init.d.
#
#               Written by Miquel van Smoorenburg <miquels@cistron.nl>.
#               Modified for Debian GNU/Linux
#               by Ian Murdock <imurdock@gnu.ai.mit.edu>.
#               and again by Steve Adeff <adeffs.mythtv@gmail.com>
#
# Version:      @(#)skeleton  1.9.1  08-Apr-2002  miquels@cistron.nl
#

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
LOCATION=/usr/bin
DAEMON=$LOCATION/mythbackend
NAME="mythbackend"
DESC="MythTV Backend"

test -x $DAEMON || exit 0

set -e

USER="mythtv"
RUNDIR="/var/run/mythtv"
LOGFILE="/var/log/mythtv/mythbackend.log"
ARGS="--daemon --logfile $LOGFILE --pidfile $RUNDIR/$NAME.pid"
EXTRA_ARGS="-v important"
NICE=0

if [ -f /etc/mythtv/mythbackend ]; then
  . /etc/mythtv/mythbackend
fi


echo rundir: $RUNDIR
echo user: $USER

ARGS="$ARGS $EXTRA_ARGS"

mkdir -p $RUNDIR
chown -R $USER $RUNDIR


case "$1" in
  start)
        echo -n "Starting $DESC: $NAME"
##       For those with firewire this will reset things before the backend starts. 
##       Should replace with keep_dct_alive.sh script at some point.
#       firewire_tester -R
#       firewire_tester -B -p 0 -n 0 -r 10
#       firewire_tester -B -p 0 -n 1 -r 10
#       firewire_tester -B -p 0 -n 2 -r 10
        start-stop-daemon --start --pidfile $RUNDIR/$NAME.pid \
                --chuid $USER --nicelevel $NICE --exec $DAEMON -- $ARGS
        echo "."
        ;;
  stop)
        echo -n "Stopping $DESC: $NAME "
        start-stop-daemon --stop --oknodo --pidfile $RUNDIR/$NAME.pid \
                --chuid $USER --exec $DAEMON -- $ARGS
        echo "."
        ;;
  restart|force-reload)
        echo -n "Restarting $DESC: $NAME"
        start-stop-daemon --stop --oknodo --pidfile $RUNDIR/$NAME.pid \
                --chuid $USER --exec $DAEMON -- $ARGS
        echo "."
        sleep 3
        start-stop-daemon --start --pidfile $RUNDIR/$NAME.pid \
                --chuid $USER --nicelevel $NICE --exec $DAEMON -- $ARGS
        echo "."
        ;;
  *)
        N=/etc/init.d/$NAME
        # echo "Usage: $N {start|stop|restart|reload|force-reload}" >&2
        echo "Usage: $N {start|stop|restart|force-reload}" >&2
        exit 1
        ;;
esac

exit 0
##############################################################################
EOF

if [ -d $LOGDIR ]; then 
	echo mythtv log directory already exist. Nothing done.
else
	echo creating mythtv log directory
	mkdir -p $LOGDIR
	chown -R mythtv:mythtv $LOGDIR
fi

if [ -f /etc/init.d/mythbackend ]; then
	chmod +x /etc/init.d/mythbackend
	chmod 755 /etc/init.d/mythbackend
#	update-rc.d mythbackend defaults 95 18
	echo starting mythbackend
	/etc/init.d/mythbackend start && tail /var/log/mythtv/mythbackend.log
else
	echo ERROR. Check script. mythbackend should be created.
fi

echo OK.
