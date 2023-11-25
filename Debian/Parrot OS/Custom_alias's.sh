#!/bin/bash

Now_hourly= $(date +%d-%b-%H_%M)


Create_backup () {
    cd ~
#    echo kali | sudo cp .bashrc .bashrc.backup
    echo kali | sudo cp .zshrc .zshrc_Backup_"$Now_hourly".backup

    echo "\n\n#ODYSSEUS'S CUSTOM COMMANDS LIST\n" | sudo tee -a .zshrc
    echo "#Improved Ease Of Use\n" | sudo tee -a .zshrc

}

System_alias () {
    #SYSTEM
    echo "alias lt='ls --human-readable --size -1 -S --classify' #Improved File Visability & Layout" | sudo tee -a .zshrc
    echo "alias upgrade='sudo apt-get update && sudo apt-get upgrade' #Update And Upgrade In One Command" | sudo tee -a .zshrc
    echo "alias ports='netstat -tulanp' #Lists all open ports" | sudo tee -a .zshrc
    echo "alias c='clear' #Shorterns The Clear Command" | sudo tee -a .zshrc
    echo "alias cleardown='cd ~/Downloads && rm -r *' #Clears downloads folder" | sudo tee -a .zshrc
    echo "alias cls='clear && ls' #Clears & Lists Files" | sudo tee -a .zshrc
    echo "alias datenow='date +%d-%b-%H_%M'" | sudo tee -a .zshrc
    #echo "alias shortName='Command_Here'" | sudo tee -a .zshrc

}

Python_alias () {
    echo "alias ve='python3 -m venv ./venv' #Creates A Python Virtual Environment In Current Dir" | sudo tee -a .zshrc
    echo "alias va='source ./venv/bin/activate' #Activates The Python venv" | sudo tee -a .zshrc
    echo "alias reqs='python3 -m pip install requirements.txt' #Installs Requirements.txt From Current Dir" | sudo tee -a .zshrc
    #echo "alias shortName='Command_Here'" | sudo tee -a .zshrc

}

Misc_Alias () {
    echo "alias ody='toilet ODYSSEUS.. -f smblock -w 500 | lolcat'" | sudo tee -a .zshrc
    echo "alias legend='toilet LIVING LEGEND.. -f smblock -w 500 | lolcat'" | sudo tee -a .zshrc

}

Advanced_alias () {
    #ADVANCED ALIASES (FUNCTIONS)
    echo '\n\n #ADVANCED ALIASES (FUNCTIONS)\n' | sudo tee -a .zshrc

    echo '#SHOWS PUBLIC IP WHICH ISNT SUPPORTED BY IPCONFIG' | sudo tee -a .zshrc
    echo 'pubip(){' | sudo tee -a .zshrc
    echo '   pubip="$(dig +short myip.opendns.com @resolver1.opendns.com)"' | sudo tee -a .zshrc
    echo '   echo Public IP Address: "\e[1;4;34m${pubip}\e[0m"' | sudo tee -a .zshrc
    echo    "\n}" | sudo tee -a .zshrc
    echo \n\n | sudo tee -a .zshrc


# More Functions Here
}