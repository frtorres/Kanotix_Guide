

wine-staging, Kanotix Factoid: [https://kanotix.com/files/fix/install-wine-staging.sh]
take into account one wine library excluded on this factoid.

     apt-get remove --purge --yes $(dpkg -l|awk '/wine/{print $2}'|grep -v libkwine)
     apt-get autoremove


1. remove traces and installed applications. Normally installed under ~/.wine 

    cd $HOME
    rm -r .wine
    rm .config/menus/applications-merged/wine*
    rm -r .local/share/applications/wine
    rm .local/share/desktop-directories/wine*
    rm .local/share/icons/????_*.xpm
