#!/bin/sh

/etc/init.d/vdr stop
/etc/init.d/vdradmin-am stop

echo vdr stopped

/etc/init.d/mythtv-backend start


#v4l2-ctl -d /dev/video0 -i 2
#Video input set to 2 (Composite 1: ok)
#v4l2-ctl -d /dev/video0 --log-status

