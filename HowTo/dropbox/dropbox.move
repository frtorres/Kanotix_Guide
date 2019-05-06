Howtos: dropbox move base directory
Kanotix Guide
Mon Jan 14 00:40:18 -05 2019
-----------------------------------

1. Install dropbox as usual.
2. Stop Dropbox Daemon
3. Create /home/Dropbox with identical "stat" as ~/Dropbox
4. ln -s /home/Dropbox Dropbox


