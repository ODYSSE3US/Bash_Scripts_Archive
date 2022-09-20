#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color





echo Basic Installer Script
echo "Would You Like To Install The Reccomended Packages?"
read -p "Continue (y/n)?" CONT
if [ "$CONT" = "y" ]; then
sudo apt-get update && upgrade
  sudo apt-get install wine
  sudo apt-get install git
  sudo apt-get install python
  sudo apt-get install python3
  sudo apt-get install wget
  sudo apt-get install vscode
  sudo apt-get install cmatrix
  sudo apt-get install figlet
  sudo apt-get install lolcat
  sudo apt-get install toilet
  sudo apt-get install nemo
  sudo apt-get install nano
  #apt-get install
  exit;

elif [ "$CONT" = "n" ]; then
  printf "Would You Like To Install The BlackArch Repository?"
  printf "${RED}WARNING: This Requires Root Privleges.${NC}"
  read -p "Continue (y/n)?" CONFI
  if [ "$CONFI" = "y" ]; then
  sudo su
  apt update && sudo apt full-upgrade -y
  

else
  exit;
fi