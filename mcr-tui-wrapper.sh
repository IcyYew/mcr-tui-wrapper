#!/bin/sh

#
#
#  IMPORTS
#
#
. ./.env
. ./libs/mcrw-functions.lib
. ./libs/advancements.lib

. ./menus/advancements.sh
. ./menus/player-access-management.sh

# Main TUI loop
while :
do
	# Clean up screen
	clear
	printf "MCR TUI WRAPPER\n1. PLAYER ACCESS MANAGEMENT\n2. ADVANCEMENTS\n3. MESSAGE ALL\n4. LIST USERS\n9. EXIT\n"
	read SELECTION_VAR
	case "$SELECTION_VAR" in
		1)
			player_access_management_menu
		 ;;
		2)
			advancements_menu
		;;
		3) 
			clear
			printf "Input text to send to all users: "
			read TEXT
			clear
			if OUTPUT=$(tellall "$TEXT" 2>&1); then
				printf 'You sent the message: %s\n' "$OUTPUT"
			else
				printf 'Message not sent\n'
			fi
			wait_for_user
			advancements_menu
		;;
		4)clear
			# Define OUTPUT variable to read the output of the list function
			OUTPUT=$(list 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		;;

		 # Case 9 obvious
	 	9) clear
			printf "Bye bye! o/\n"
			wait_for_user
			clear
			exit
		;;
		*) clear
			printf "Not implemented\n"
			wait_for_user
		;;
	esac
done
