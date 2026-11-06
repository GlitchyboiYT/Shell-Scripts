#!/bin/bash
hir='\033[0;91m'
bg='\033[1;32m'
nc='\033[0m'
show_menu(){
	clear
	echo -----------------
	echo -e --${hir}School${nc}-${hir}Script${nc}--
	echo -----------------
	echo
	echo =================
	echo [1] Start
	echo =================
	read -p "Pick an Option: " opt
	case $opt in
		1)
			clear
			echo Test
			echo
			echo Test 2
			echo
			echo Test 3
			;;
		esac
}
show_menu