<img align="right" src="../kanotix48.png">
## Kanotix_Guide
###### Install: Virtual Box 6.0
###### Sun 06 Mar 2022 09:06:20 AM EST
---

<mark>There was no current install script. Adapted one.</mark>

echo 'deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bullseye contrib' > /etc/apt/sources.list.d/vbox.list;wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox_2016.asc -O- | sudo apt-key add -;apt-get update && apt-get install --yes virtualbox-6.1;adduser $(getent passwd 1000|sed 's/:.*//') vboxusers



| Kanotix           | Description                           |
| ----------------- | ------------------------------------- |
| speedfire         | Tested ok                             |


1) Install vbox

    install-vbox-speedfire.sh    

2) Problems scaling and windows resizing were found.
[ Workaround to avoid disable of hidpi res ](https://www.virtualbox.org/ticket/15355)

Given a global scale factor of 2 set in kcmshell5 kcm_kscreen, start your vm like this:

```
QT_SCALE_FACTOR=0.5 VBoxManage startvm "vm name"
QT_SCALE_FACTOR=0.5 virtualbox
```

After booting has finished (and guest additions are up and running), set Scale factor to 200%. 
Those two settings together makes it so that you aren't left with a small screen top left.

3) 4K Scaling. The best solution is apparently to select a 2K video mode along with x2 scaling in the VM settings.
     
[ Parameters recommended for 4k ] (https://forums.virtualbox.org/viewtopic.php?t=91585)

