#!/bin/bash

logo () {
    clear
    :"
                                       ██████╗ ██████╗ ██╗   ██╗███████╗███████╗███████╗██╗   ██╗███████╗
                                      ██╔═══██╗██╔══██╗╚██╗ ██╔╝██╔════╝██╔════╝██╔════╝██║   ██║██╔════╝
                                      ██║   ██║██║  ██║ ╚████╔╝ ███████╗███████╗█████╗  ██║   ██║███████╗
                                      ██║   ██║██║  ██║  ╚██╔╝  ╚════██║╚════██║██╔══╝  ██║   ██║╚════██║
                                      ╚██████╔╝██████╔╝   ██║   ███████║███████║███████╗╚██████╔╝███████║
                                       ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚══════╝
                                                               Stalker Tools


"
}

Check_Dependencies () {

    echo -n "Checking dependencies... "
    for name in python curl git toilet lolcat python-qt4 make nano
    do
        [[ $(which $name 2>/dev/null) ]] || { echo -en "\n$name needs to be installed. Use 'sudo apt-get install $name'";deps=1; }
    done
        [[ $deps -ne 1 ]] && echo "OK" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }
}

check_version () {
    version=curl https://raw.githubusercontent.com/ODYSSE3US/Bash_Scripts_Archive/Boring_Files/Build_Versions/Stalker_tools.txt
    CURRENT_VERSION="1.0"
    if ["$version" > "$CURRENT_VERSION"]; then
        echo -n "There is an update avalible Version: $version"
        read -p "|Would You Like To Downlod It? Y/N " download
        if [ "$download" = "Y" ]; then
            mkdir ~/miscFiles && cd miscFiles
            curl --output "Stalker_tools_V$version.sh"
            echo "Exiting... Re-run installer Version $version located in ~/miscFiles."
            exit 0
        fi
    fi

}

Create_Dirs () {
    cd ~/
    mkdir stalkers
    cd stalkers
    mkdir passwordlists
    mkdir notes
    mkdir social_media
    mkdir tracking
    #mkdir 
    #mkdir
    #mkdir
    
}


Download_Files () {
    ############################################################# WORD LISTS #############################################################

    # Password Files
    echo "\n"
    toilet DOWNLOADING PASSWORD LISTS.. -f smblock -w 500
    echo "____________________________________________________"
    cd ~/stalkers/passwordslists
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt --output Top100.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-500.txt --output Top500.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-1000.txt --output Top1K.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-10000.txt --output Top10K.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100000.txt --output Top100K.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-1000000.txt --output Top1M.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/NordVPN.txt --output NordVPN.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/muslimMatch.txt --output MuslimMatch.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/myspace.txt --output MySpace.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/youporn2012-raw.txt --output YouPorn2012.txt
    curl https://github.com/danielmiessler/SecLists/raw/master/Passwords/Leaked-Databases/rockyou.txt.tar.gz --output rockyou.txt.tar.gz
}

git_clone () {
    # Var Dirs
    HOME=~/
    stalkers=~/stalkers
    socialMedia=~/stalkers/social_media
    tracking=~/stalkers/tracking

    cd $socialMedia
    # Installing and setting up Geocreepy | http://www.geocreepy.com/
    git clone https://github.com/jkakavas/creepy.git && cd $socialMedia/creepy && pip install pytz python-qt flickrapi python-instagram yapsy tweepy google-api-python-client python-dateutil configobj dominate
    curl https://github.com/jkakavas/creepy-plugins/tarball/master --output Plugins_v1.41.tar.gz

    #Web based email info gathering tool
    cd $tracking
    mkdir iKy && cd $tracking/iKy
    curl http://download.redis.io/redis-stable.tar.gz --output redis-stable.tar.gz && tar xvzf redis-stable.tar.gz
    curl https://kennbroorg.gitlab.io/ikyweb/file/iKy.zip --output iKy.zip && unzip iKy.zip
    rm -f iKy.zip && rm -f redis-stable.tar.gz
    cd iKy-pack && python pip install -r requirements.txt
    curl https://raw.githubusercontent.com/kennbroorg/iKy/iKy/README.md --output Readme.md

    cd $socialMedia
    #Phone look up tool
    git clone https://github.com/AzizKpln/Moriarty-Project && cd Moriarty-Project/ && bash install.sh
    cd $socialMedia
    # Username lookup
    git clone https://github.com/sherlock-project/sherlock.git && cd sherlock && python -m pip install -r requirements.txt
    cd $socialMedia
    git clone 
    git clone 
}