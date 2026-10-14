#!/bin/bash
gren="\033[1;32m"
nc="\033[0m"
clear
echo -e "${gren}Fixing${nc}"
sudo airmon-ng check kill
sudo rfkill unblock all
sudo systemctl restart NetworkManager
exit
