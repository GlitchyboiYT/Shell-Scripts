#!/bin/bash

show_menu(){
	while true; do
		clear
		echo "========================="
		echo
		echo " Gobuster Automated V1.0 "
		echo
		echo "========================="
		echo
		echo
		echo "-------------------------"
		echo "[1] Start"
		echo "[2] Exit"
		echo "-------------------------"

		read -p "What do you want to do? " opt
		case $opt in
			1)
				echo Starting...
				sleep 3
				clear
				read -p "Type the website you want to discover: " site
				;;
			2)
				clear
				exit
				;;
			*)
				clear
				echo "Not an Option. Try Again."
				sleep 2
				show_menu
			esac
	done
}
show_menu
