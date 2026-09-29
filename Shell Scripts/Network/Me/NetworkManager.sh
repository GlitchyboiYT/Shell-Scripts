#!/bin/bash

show_menu() {
	while true; do
	clear
	echo "---------------------------"
	echo "   Network Manager V1.0    "
	echo "---------------------------"
	echo
	echo "==========================="
	echo "[1] Enable Monitor Mode"
        echo "[2] Disable Monitor mode"
        echo "[3] Restart Network Manager"
        echo "==========================="

        read -p "Pick an answer: " opt

        case "$opt" in
                "1")
                        read -p "Network Interface: " netinf1
                        sudo airmon-ng start $netinf1
                        echo "Started Monitor mode on $netinf1"
                        ;;
                "2")
                        read -p "Network Interface(without mon): " netinf2
                        sudo airmon-ng stop "$netinf2"mon
                        echo "Stopped Monitor mode on $netinf2"
                        ;;
                "3")
                        sudo systemctl restart NetworkManager
                        echo "Restarted NetworkManager"
                        ;;
                "*")
                        echo "Not an Option. Try again"
                        sleep 2
                        ;;
                esac
        done
}
show_menu
