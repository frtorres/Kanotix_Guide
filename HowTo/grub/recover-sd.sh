#!/bin/sh                                                                                      # Copyleft 2013-2014  Francisco Torres R (frtorres), Panama, RepPanama, C.America
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
#  Francisco Torres <pacho.torres.reyes at gmail.com>.
#  V 1.0 - Original.
#  
# ----------------------------------------------------------------
CUR_SCRIPT=`basename "$0"`
VERS=1.0
STEP="\tStarting at\033[0;32m\t:$(date).\033[00m"
_NOW=$(date +"%m_%d_%Y")
    
echo -n
echo recover grub on a SD memory card sdb1, MOUNTED on  
echo "Script\t\t-$0-Ver $VERS- $STEP"
echo ---------------------------------------------------------------------------------------
echo generating ...


echo
fdisk -l
mkdir -p /media/sdb1
mount /dev/sdb1 /media/sdb1
/usr/sbin/grub-install --recheck --no-floppy --root-directory=/media/sdb1 /dev/sdb
reboot
update-grub
cp /boot/grub/grub.cfg /media/sdb1


            


