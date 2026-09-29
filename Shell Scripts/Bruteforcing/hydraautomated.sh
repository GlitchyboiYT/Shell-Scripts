#!/bin/bash
clear
show_menu(){
	while true; do

	echo "--------------------------"
	echo
	echo "  Hydra Bruteforcer V1.1  "
	echo "        -Glitch           "
	echo "--------------------------"
	echo
	echo "=========================="
	echo "Available Services:"
	echo "[1] HTTP"
	echo "[2] SSH"
	echo "[3] FTP"
	echo "[4] RDP"
	echo "=========================="
	echo
	read -p "Choose what you want to bruteforce: " opt
	case $opt in

		1)
			clear
			echo "HTTP Selected."
			sleep 1
			read -p "Website or IP: " httpsite
			read -p "path[1] or one username[2]? " puh
			read -p "path[1] or one password[2]? " pph
			read -p "Type path to usernames to use or type a username to use: " usernameh
			read -p "Type path to passwords to use or type a password to use: " passwordh
			read -p "Does the website/ip have a login box[1], use GET perms[2] or use POST perms[3]" httpmod
			case $puh in
				1)
					pathoruserh=L
					;;
				2)
					pathoruserh=l
					;;
				esac
			case $pph in
				1)
					pathorpassh=P
					;;
				2)
					pathorpassh=p
					;;
				esac
			case $httpmod in
				1)
					clear
					echo "Login Box Selected."
					sleep 1
					read -p  "Please write the directory of login box(ex. website.com[/directory/]): " dirlogbox
					hydra -$pathoruserh $usernameh -$pathorpassh $passwordh $httpsite http-get $dirlogbox
					;;
				2)
					clear
					echo "GET perms selected."
					sleep 1
					read -p "Please write the directory of get perms(ex. website.com[/directory.php/ or /directory/]): " dirgetperms
					read -p "Username box name: " nameofuserboxget
					read -p "Password box name: " nameofpassboxget
					hydra -$pathoruserh $usernameh -$pathorpassh $passwordh 'http-get://"'$httpsite'"/"'$dirgetperms'"?username="'$nameofuserboxget'"&password="'$nameofpassboxget'"'
					;;
				3)
					clear
					echo "POST perms selected."
					sleep 1
					read -p "Please write the directory of POST perms(ex. website.com[/directory.php/ or /directory/]):" dirpostperms
					read -p "Username box name: " nameofuserboxpost
					read -p "Password box name: " nameofpassboxpost
					read -p "Submit box name: " nameofsubmitpost
					read -p "Failed text: " nameofloginfailed
					hydra -$pathoruserh $usernameh -$pathorpassh $passwordh $httpsite http-post-form "$dirpostperms":user="$nameofuserboxpost"&pass="$nameofpassboxpost"&login="$nameofsubmitpost":F="$nameofloginfailed"
					;;
				esac
			;;
		2)
			clear
			echo "SSH Selected."
			sleep 1
			read -p "IP or Hostname to connect to " iphosts
			read -p "path[1] or one username[2]? " pus
			read -p "path[1] or one password[2]? " pps
			read -p "Type path to usernames or type a username to use: " usernames
			read -p "Type path to passwords or type a password to use: " passwords
			read -p "What port to use: " ports
			case $pus in
				1)
					pathorusers=L
					;;
				2)
					pathorusers=l
					;;
				esac
			case $pps in
				1)
					passorpasss=P
					;;
				2)
					passorpasss=p
					;;
				esac
			hydra -$pathorusers $passwords -$pathorpasss $usernames -s $ports ssh://$iphost
			;;
		3)
			clear
			echo "FTP Selected."
			sleep 1
			read -p "IP or Hostname to connect to " iphostf
			read -p "path[1] or one username[2]? " puf
			read -p "path[1] or one password[2]? " ppf
			read -p "Type path to usernames or type a username to use: " usernamef
			read -p "Type path to passwords or type a password to use: " passwordf
			read -p "What port to use: " portf
			case $puf in
				1)
					pathoruserf=L
					;;
				2)
					pathoruserf=l
					;;
				esac
			case $ppf in
				1)
					pathorpassf=P
					;;
				2)
					pathorpassf=p
					;;
				esac
			hydra -$pathoruserf $usernamef -$pathorpassf $passwordf -s $portf ftp://$iphostf
			;;
		4)
			clear
			echo "RDP Selected."
			read -p "Do you want to specify domain? [Y/N] " dodomainr
			case $dodomainr in
				[yY])
					read -p "Domain: " domainr
					read -p "Port: " portr
					read -p "IP: " iphostr
					read -p "path[1] or one username[2]? " pur
					read -p "path[1] or one password[2]? " ppr
					read -p "Type path to usernames or type a username to use: " usernamer
					read -p "Type path to passwords or type a password to use: " passwordr
					case $pur in
						1)
							pathoruserr=L
							;;
						2)
							pathoruserr=l
							;;
					;;
				[nN])
					read -p "Port: " portr
					read -p "IP: " iphostr
					;;
				esac
			;;
		*)
			clear
			echo "Not an Option. Try again."
			sleep 2
			show_menu
			;;
		esac
	done
}
show_menu
