#!/bin/bash
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
#  Mon Aug  8 20:56:35 UTC 2016
#
#  Francisco Torres <pacho.torres.reyes@gmail.com>.
#  V 1.0 - Original.
# ----------------------------------------------------------------
echo
echo $0 ": to setup an access point (live)."

if [ "$#" -eq 2 ]; then
 echo "Error: must be 2 parameters:(SSID and password), $# provided!." >&2
 exit 1
fi

if [ $(id -u) != 0 ]; then
 echo "Error: You must be root to run this script!" >&2
 exit 1
fi

bash create_ap.bash --no-virt wlan0 eth0 $1 $2

echo $0: ending...


