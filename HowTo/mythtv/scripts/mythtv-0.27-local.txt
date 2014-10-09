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
#  Tue Oct  7 22:06:04 EST 2014
# ----------------------------------------------------------------
# Oct 5 2013 .  Updated FATR to ver 0.27
# Dec 12,2010 updated dependencies for some mythth-plugins.
# apt-get install libmp3lame-dev libqt4-opengl libqt4-opengl-dev libqt4-sql-mysql qt4-dev-tools libqt4-dev libcdaudio-dev libtag1-dev python-pycurl libxml-xpath-perl libimage-size-perl libdatetime-format-iso8601-perl libxml-simple-perl python-oauth python-lxml python-mysqldb libnet-upnp-perl
#
# apt-get install libXxf86vm-dev
# apt-get install libqtwebkit-dev
#
# apt-get install libdate-calc-perl for weather scripts
# AN ACCOUNT WAS OPEN
#You need to sign up for an API key from wunderground and put it into
#/var/lib/mythtv/.mythtv/MythWeather/wunderground.key
#Visit: http://www.wunderground.com/weather/api/

# 0.26
# apt-get install uuid-dev
# apt-get install python-mysqldb
# apt-get install python-urlgrabber

mythversion=mythtv/mythtv
target=$HOME/$mythversion
cd $HOME

read n
pwd


echo ====================================
echo Step 1: downloading sources
echo =====================================

git clone -b fixes/0.27 git://github.com/MythTV/mythtv.git

read n

echo ====================================
echo Step 2: mythtv compilation
echo =====================================
cd $target

./configure
# To support mythvision add --with-bindings
./configure --prefix=/usr --enable-proc-opt --enable-audio-alsa --enable-hdhomerun --disable-joystick-menu --disable-firewire --enable-xv --enable-vdpau --with-bindings=perl,python




time make -j 2

sudo make install;
sudo /etc/init.d/mythtv-backend restart

echo ====================================
echo Step 3: mythplugins compilation
echo =====================================
#cd $target/mythplugins
#make distclean
#./configure --prefix=/usr
#time make -j12
#sudo make install

echo ====================================
echo Step 4: myththemes compilation
echo =====================================
#cd $target/myththemes
#./configure --prefix=/usr
#sudo make install

#echo ====================================
#echo Step 9: nuvexport install
#echo =====================================
# See dependencies. Required ffmpeg installed from multimedia repo.
#cd $target/mythextras/nuvexport
#sudo make install

cat <<EOF
now switch to root and run make install

then 
 - run mythtv-setup for possible database upgrade
 - run mythtv-backend daemon

references: 
http://www.mythtv.org/docs/mythtv-HOWTO-5.html
http://dolot.kipdola.com/wiki/Install_MythTV

EOF


