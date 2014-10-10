#!/bin/sh
#
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
#  Francisco Torres <pacho.torres.reyes@gmail.com>.
#  V 1.0 - Original.
#  Tue Oct  7 22:04:44 EST 2014
# ----------------------------------------------------------------
# Configured and revised  FATR
# Panama - Jan 11,2011

echo mythtv local uninstalling. 

#mythversion=mythtv-0.24.1
mythversion=mythtv-0.23

echo working on mythtv version: $mythversion
echo target is: $target
target=$HOME/$mythversion


#dpkg --purge $(dpkg -l|awk '/030200rc/{print $2}')

echo uninstalling mythtv from source make file
echo
cd $HOME
cd $target/mythtv
sudo make uninstall
sudo make clean
make distclean

echo uninstalling mythplugins from source make file
echo
cd $HOME
cd $target/mythplugins
make distclean
sudo make clean
sudo make uninstall

echo uninstalling myththemes from source make file
echo
cd $HOME
cd $target/myththemes
sudo make uninstall

echo deleting database.
echo

cat <<EOF
*** Note this to remove the Database
mysql -u root
mysql> DROP DATABASE IF EXISTS mythconverg;
mysql> quit
EOF

#mysql -u root
#mysql -u [username] -p [password] mythconverg DROP DATABASE;
mysql -u root mythconverg DROP DATABASE;

echo removing local sources
rm /etc/init.d/mythbackend
rm /var/log/mythbackend.log
#rm -rf /var/log/mythtv
#rm -rf $mythversion

echo revisar y eliminar mythtv source dir
echo ============ Script Finished ===================

