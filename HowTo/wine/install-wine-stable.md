# Kanotix_Guide
## HowTo: Install wine stable
### Sun Aug 24 19:51:08 EST 2014
---

```
https://gist.github.com/leemour/05bda5fd83e7e4fac500c45534f22479
https://linuxconfig.org/install-wine-on-ubuntu-18-04-bionic-beaver-linux
http://ru.d-ws.biz/articles/ubuntu-18-04-wine.shtml
```

1. Install wine:

```
    sudo apt install wine64
    wine64 --version
```

2. To enable internet access:

apply this directly on file. NOT on symlink

```
    ls -lah /usr/bin/wine64-stable 
    setcap cap_net_raw+epi /usr/lib/wine/wine64
    wine64-stable ping.exe 8.8.8.8

    dpkg-reconfigure <installed wine s>
```

3. Install windows app.  
Irfanview 64bits was installed ok.
Notepad++ seems to have a not supported 64bit file
wine64 iview459_plugins_x64_setup.exe


4. Install pdf printer, (CUPS is supported by wine).


5. wine stable and wine-staging can be installed at the same time.
[see here for an explanation] ()

    $WINEPREFIX 

should be set accordingly to wine version used and associated apps.



