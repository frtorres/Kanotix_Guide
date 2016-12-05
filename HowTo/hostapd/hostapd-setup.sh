#!/bin/sh
# Copyright 2013-2016  Francisco Torres R (frtorres), Panama, RepPanama, C.America
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
#  Mon Nov 14 23:36:13 UTC 2016
#
#  Francisco Torres <pacho.torres.reyes@gmail.com>.
#  V 1.0 - Original.
#  
#  see: https://help.ubuntu.com/community/WifiDocs/WirelessAccessPoint#Install_Ubuntu_Server
# ----------------------------------------------------------------
echo
echo $0 ":to setup an access point (live)."
if [ $(id -u) != 0 ]; then
 echo "Error: You must be root to run this script!" >&2
	 exit 1
fi

RED=`ifconfig | grep eth`
if ifconfig | grep eth > /dev/null
then
   echo "$0: ethernet found: $RED"
else
   echo "- No eth card found." >&2
   exit 1
fi

WLAN=`ifconfig | grep wlan`
if ifconfig | grep wlan > /dev/null
then
   echo "$0: wifi found: $WLAN"
else
   echo "- No wifi card found." >&2
   exit 1
fi

echo
echo "enter to continue..."
read dummy
echo

apt-get update
apt-get install iw

echo "checking wifi hardware capabilities (check AP, and managed are shown)"

if iw list|grep AP > /dev/null
then
   echo "- AP functionality supported."
else
   echo "$WLAN:- AP functionality NOT supported, exiting." >&2
   exit 1
fi

if iw list|grep managed > /dev/null
then
   echo "- managed functionality supported."
else
   echo "$WLAN:- managed functionality NOT supported, exiting." >&2
   exit 1
fi

echo
echo "enter to continue..."
read dummy
echo

echo "installing dependencies..."
apt-get install dnsmasq
apt-get install hostapd
apt-get install bash
apt-get install util-linux
apt-get install iproute2
apt-get install iw
apt-get install haveged
apt-get install iwconfig
apt-get install iptables
apt-get install bridge-utils

echo "now, activate an access point, check results, leaving terminal to see logs and key exchange..."

# FOUND=`fgrep -c "FOUND" $VALIDATION_FILE`
#  if [ $FOUND -eq 0 ]; then
#    echo "Not able to find"
#  else
#    echo "able to find"     
#  fi  
# grep -E "(string)" /path/to/file || echo "no match found"

