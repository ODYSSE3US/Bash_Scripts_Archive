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
    Productivity
    Social
    Security
    CyberSec
    echo Done..
    exit 0
}