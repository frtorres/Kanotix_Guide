###Howtos: nerd fonts
###Kanotix_Guide
###Sun Sep 19 20:50:15 EST 2021
#-----------------------------

1. Installed 

```
 apt install fonts-hack-ttf
```


```
  dpkg-reconfigure console-setup
  vim /etc/default/console-setup 
```

PROBLEM: hacker fonts not rendered

2. https://wiki.debian.org/Fonts

```
  fc-list
  fc-list|grep hacker
  fc-cache -fv
  xlsfonts 
  xlsfonts |grep hacker
# With this commands ttf fonts was activated.  
  dpkg-reconfigure fontconfig
  dpkg-reconfigure fontconfig-config
  apt-get install font-manager
```

PROBLEM: hacker fonts did not show special chars.

3. Going back

```
 apt-get remove --purge fonts-hack-ttf font-manager
 fc-cache -fv
 dpkg-reconfigure fontconfig
 dpkg-reconfigure fontconfig-config
```

Accidentally in KDE FONTS Config, unchecked all different fonts to Hacker Font.
>>> Lost Fonts :(

Fonts are normally installed at:

```
ls -R /usr/share/fonts
```

FIX:

```
dpkg-reconfigure fontconfig
dpkg-reconfigure fontconfig-fontconfig

#default kanotix font
apt install fonts-noto

dpkg-reconfigure fontconfig
dpkg-reconfigure fontconfig fontconfig-config

apt install fonts-liberation fonts-liberation2
dpkg-reconfigure fontconfig fontconfig-config
fc-cache -fv

apt install ttf-mscorefonts-installer
fc-cache -fv

#ftview not installed by default.
dpkg-reconfigure fontconfig-config

#
FREETYPE_PROPERTIES="truetype:interpreter-version=35" ftview 16 /usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf
```

Liberation font (libreoffice dfault FONT) somehow was not available systemwide.

I tried (no sucess):

[fonts liberation 1.07 pakcage] (http://ftp.de.debian.org/debian/pool/main/f/fonts-liberation/fonts-liberation_1.07.4-11_all.deb)

```
apt-get remove --purge fonts-liberation 
```
to leave v2 only

FIX Pending.
- Anyway, microsoft fonts seems to "replace" liberation fonts.

