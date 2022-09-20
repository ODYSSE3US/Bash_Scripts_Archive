#!/bin/bash

#GUI Package Manager
sudo echo kali | sudo -S apt-get -y install synaptic
sleep 5
cd /etc/apt
sudo echo -e "\n\n" >> sources.list
sleep 0.5
sudo echo "deb http://kali.download/kali/ kali-rolling main non-free contrib" >> sources.list
sleep 0.5
sudo echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> sources.list
sleep 0.5
sudo echo "deb http://http.kali.org/kali kali-last-snapshot main non-free contrib" >> sources.list
sleep 0.5
sudo echo "deb http://http.kali.org/kali kali-experimental main non-free contrib" >> sources.list
sleep 0.5
sudo echo "deb-src http://http.kali.org/kali kali-rolling main non-free contrib" >> sources.list

clear
sudo echo "Done! running package manager.."
sleep 3
sudo synaptic