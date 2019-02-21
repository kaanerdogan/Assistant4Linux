#!/bin/sh
while :
do
	echo "\n1-Check for reboot"
	echo "2-View Xinput"
	echo "3-Schedule for shutdown"
	echo "4-Cancel shutdown process"
	echo "5-Check for updates"
	echo "6-Upgrade"
	echo "7-Autoremove"
	echo "8-Clear console"
	echo "9-Exit"
	echo "Please specify a number between (1-9)\n"
	read answer
	case $answer in
		1)
			if [ -f /var/run/reboot-required ]; then
				echo "You need to reboot your computer"
			else
				echo "No need for reboot"
			fi
		;;
		2)
			xinput
			echo "\n\nEnter an id for disable"
			read touchid
			xinput --disable $touchid
			echo "\nThe device with $touchid id is disabled"
			break
		;;
		3)
			echo "______________________________________"
			echo "Specify minute for shutdown:"
			echo "--------------------------------------"
			read min
			if [ $min -z ]; then
				echo "____________________________________________"
				echo "\nYour computer will shutdown in 15 minutes"
				echo "--------------------------------------------"
				shutdown -h 15
			else
				shutdown -h $min
				echo "\nYour computer will shutdown in  $dk minutes\n"
			fi
		;;
		4)
			shutdown -c
			echo "\nShutdown process has been canceled"
		;;
		5)
			sudo apt update
		;;
		6)
			sudo apt upgrade
		;;
		7)
			sudo apt autoremove
		;;
		8)
			clear
		;;
		9)
			break
		;;
		*)
			echo "Wrong number. Please choose your number correctly"
		;;
	esac
done
