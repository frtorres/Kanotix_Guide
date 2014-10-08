#!/bin/sh

# Dec 12,2010 updated dependencies for some mythth-plugins.
# apt-get install libmp3lame-dev libqt4-opengl libqt4-opengl-dev libqt4-sql-mysql qt4-dev-tools libqt4-dev libcdaudio-dev libtag1-dev python-pycurl libxml-xpath-perl libimage-size-perl libdatetime-format-iso8601-perl libxml-simple-perl python-oauth python-lxml python-mysqldb libnet-upnp-perl

# apt-get install libXxf86vm-dev
# apt-get install libqtwebkit-dev

# 0.26
# apt-get install uuid-dev
# apt-get install python-mysqldb
# apt-get install python-urlgrabber


mythversion=mythtv/mythtv
target=$HOME/$mythversion
cd $HOME

echo ====================================
echo Step 1: downloading sources
echo =====================================

git clone -b fixes/0.26 git://github.com/MythTV/mythtv.git


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

