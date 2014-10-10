#!/bin/sh
# Configured and revised  FATR
# Panama - Jan 11,2011

echo essentials
sudo apt-get install build-essential cvs subversion git mercurial

# Dec 12,2010 updated dependencies for some mythth-plugins.

echo building dependencies
sudo apt-get install libmp3lame-dev libqt4-opengl libqt4-opengl-dev libqt4-sql-mysql qt4-dev-tools libqt4-dev libcdaudio-dev libtag1-dev python-pycurl libxml-xpath-perl libimage-size-perl libdatetime-format-iso8601-perl libxml-simple-perl python-oauth python-lxml python-mysqldb libnet-upnp-perl

mythversion=mythtv-0.24.1
echo working on mythtv version: $mythversion
echo target is: $target

target=$HOME/$mythversion

cd $HOME

echo ====================================
echo Step 1: Current mythtv install info
echo =====================================
echo ls info /usr/lib and /usr/bin
sudo dpkg -l|grep mythtv
#ls /usr/lib/*myth*
#ls /usr/bin/*myth*
#mythfrontend --version

echo ====================================
echo Step 2: mythtv compilation
echo =====================================

#rm -rf $mythversion
# Stable: get the 0.24 stable branch  **** RELOCATED ****
svn co http://code.mythtv.org/svn/branches/release-0-24-fixes/ $mythversion

# Unstable: anonymous subversion access for the development version: 
# see howto file.  svn changed as of Dec 10,2010.

#svn co http://code.mythtv.org/svn/trunk/ mythtv-trunk
#svn co http://code.mythtv.org/svn/trunk/mythtv
#svn co http://svn.mythtv.org/svn/trunk/mythplugins
#svn co http://svn.mythtv.org/svn/trunk/myththemes

cd $target/mythtv

# To support mythvision add --with-bindings
./configure --prefix=/usr --disable-xvmc --disable-xvmc-vld --enable-proc-opt --enable-audio-alsa --enable-opengl-vsync --disable-hdhomerun --disable-joystick-menu --disable-firewire --enable-xv --enable-v4l --enable-vdpau --with-bindings=perl,python

time make -j 2

sudo make install;
#sudo /etc/init.d/mythtv-backend restart
sudo /etc/init.d/mythbackend restart

echo ====================================
echo Step 3: mythplugins compilation
echo =====================================
cd $target/mythplugins
make distclean
./configure --prefix=/usr
time make -j12
sudo make install

echo ====================================
echo Step 4: myththemes compilation
echo =====================================
cd $target/myththemes
./configure --prefix=/usr
sudo make install

#echo ====================================
#echo Step 9: nuvexport install
#echo =====================================
# See dependencies. Required ffmpeg installed from multimedia repo.
#cd $target/mythextras/nuvexport
#sudo make install



cat <<EOF
============ Script Finished ===================
 
 - run mythtv-setup for possible database upgrade
 - run mythtv-backend daemon

references: 
http://www.mythtv.org/docs/mythtv-HOWTO-5.html
http://dolot.kipdola.com/wiki/Install_MythTV

EOF



