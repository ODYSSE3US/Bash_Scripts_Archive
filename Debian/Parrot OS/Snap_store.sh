#!/bin/bash

sudo apt install -y snapd
sudo snap install snap-store

Productivity () {
    #Music, Photo & Productivity
    sudo snap install spotify
    sudo snap install orange-app #Soundcloud client
    sudo snap install ultimate-media-downloader
    sudo snap install libreoffice
    sudo snap install wonderwall #Wallpaper
    sudo snap install photoscape #Photo editor
}


Social (){
    #Social
    sudo snap install discord
    snap connect discord:system-observe
    sudo snap install bluemail #Email client
    sudo snap install irccloud #IRC chat client
    sudo snap install signal-desktop
    sudo snap install telegram-desktop

}

Security () {
    #Security
    sudo snap install keepassxc #Cross-Platform Secure Password Manager
    sudo snap install bitwarden #Another crossplatform password manager
    sudo snap install newpass #password gen

}

CyberSec () {
    #Cybersecurity
    sudo snap install postman
    sudo snap install code #VScode
    #NOTE: VSCodium is pre-installed with Parrot OS, which is a community fork.
    sudo snap install certbot

}

#TODO: Create More Options instead of defaulting to all.

Install_all () {
    toilet INSTALLING ALL.. -f smblock -w 500 | lolcat
    Productivity
    Social
    Security
    CyberSec
    echo Done..
    exit 0
}

Check_Dependencies () {

    echo -n "Checking dependencies... "
    for name in toilet lolcat
    do
        [[ $(which $name 2>/dev/null) ]] || { echo -en "\n$name needs to be installed. Use 'sudo apt get install $name'";deps=1; }
    done
        [[ $deps -ne 1 ]] && echo "OK" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }
}


Check_Dependencies
Install_all