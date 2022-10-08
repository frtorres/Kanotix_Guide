#!/bin/sh
# Copyright 2013-2014  Francisco Torres R (frtorres), Panama, RepPanama, C.America
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
#  Tue Oct  7 18:11:29 EST 2014
#
#  Francisco Torres <pacho.torres.reyes@gmail.com>.
#  V 1.0 - Original.
#  Install Dropbox.
#  see: https://www.dropbox.com/en/help/246
# ----------------------------------------------------------------
echo
echo $0: to install dropbox.

if [ $(id -u) != 0 ]; then
 echo "Error: You must be root to run this script!" >&2
 exit 1
fi

# stretch seems not havieng repo. As of Oct2017.

DISTRIB_CODENAME=wheezy
grep -q jessie /etc/apt/sources.list && DISTRIB_CODENAME=jessie
grep -q stretch /etc/apt/sources.list && DISTRIB_CODENAME=stretch

echo "current linux distribution code name: -- $DISTRIB_CODENAME --"
echo setting repos

[ "$DISTRIB_CODENAME" = "wheezy" ] && cp -v dropbox.list.wheezy /etc/apt/sources.list.d/dropbox.list

[ "$DISTRIB_CODENAME" = "jessie" ] && cp -v dropbox.list.jessie /etc/apt/sources.list.d/dropbox.list

[ "$DISTRIB_CODENAME" = "stretch" ] && cp -v dropbox.list.stretch /etc/apt/sources.list.d/dropbox.list

echo getting keys
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys 5044912E

apt-get update
apt-get install python-gpgme
apt-get install dropbox

echo now as user: dropbox start -i
echo to install propietary daemon
echo Ok.





