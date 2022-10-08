echo "---updating youtube-dl."
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo wget https://yt-dl.org/downloads/latest/youtube-dl.sig -O youtube-dl.sig
#see:http://ytdl-org.github.io/youtube-dl/download.html
echo "---getting key to validate."
rm -v 18A9236D.asc  
sudo wget https://dstftw.github.io/keys/18A9236D.asc
sudo gpg --import 18A9236D.asc 
echo "---verifying signature"
sudo gpg --verify youtube-dl.sig /usr/local/bin/youtube-dl
rm -v youtube-dl.sig
rm -v 18A9236D.asc  

