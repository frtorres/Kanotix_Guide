# Kanotix_Guide
## Markdown: Best Editors
### Sun Aug 24 19:51:08 EST 2014
---

- [x] Operational
- [ ] Review needed
- [ ] Contact the ~~media~~ 

<span style="text-decoration: underline">References</span> 

<u>Referencias</u>
<i>Referencias</i>
<strong>Referencias</strong>


```
https://gist.github.com/leemour/05bda5fd83e7e4fac500c45534f22479
https://linuxconfig.org/install-wine-on-ubuntu-18-04-bionic-beaver-linux
http://ru.d-ws.biz/articles/ubuntu-18-04-wine.shtml
```

1. Download the Windows .MSI installer from: [https://clients.amazonworkspaces.com/](https://clients.amazonworkspaces.com/)

At time of this post, the Amazon WorkSpaces Client was:  
Version: 2.4.7.804  
Updated: 6/7/2018  

Information about the Ubuntu release:

    lsb_release -a
    
No LSB modules are available.  
Distributor ID: Ubuntu  
Description: Ubuntu 18.04 LTS  
Release: 18.04  
Codename: bionic  

Perform a quick package update check:  

    sudo apt update

Install wine:

    sudo apt install wine64
    wine64 --version
    wine-3.0 (Ubuntu 3.0-1ubuntu1)

Install the Amazon WorkSpaces MSI file into the default .wine prefix:

    wine64 msiexec /i ~/Downloads/Amazon+WorkSpaces.msi

Afterwards, remove a file that causes an application crash. (Replacing “username” with your account’s username and “.wine” if you used a different prefix):

    rm /home/username/.wine/drive_c/Program\ Files\ \(x86\)/Amazon\ Web\ Services\,\ Inc/Amazon\ WorkSpaces/vchan_plugins/pcoip_vchan_remoteprintclient.dll

Start the Amazon WorkSpaces client and enjoy that sweet AWS cloud WorkSpace!

[^1]:Last Edited: