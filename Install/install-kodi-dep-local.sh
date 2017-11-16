# -----------
echo -n $0:
#
# ------------
echo starting dependencies kodi install process...
echo -n this is:
cat /etc/kanotix-version
read dummy
apt-get update
apt-get dist-upgrade
apt-get install git ranger kodi
cd 
git config --global user.email "pacho.torres.reyes@gmail.com"
git config --global user.name "frtorres"
#git clone https://github.com/frtorres/Kanotix_Guide.git

