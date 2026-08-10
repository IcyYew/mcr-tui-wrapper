#!/bin/sh

#
#
#  IMPORTS
#
#
. ./.env
. ./mcrw-functions.lib

#
#
# 	ENV VARS
#
#

# These can be removed at some point since all rcon communications are handled in function libaries
# Variable definitions for visibility, all are actually sourced from .env, if you do not have a .env run init.sh and input your values
RCON_HOST="${RCON_HOST}"
RCON_PORT="${RCON_PORT}"
RCON_PASSWORD="${RCON_PASSWORD}"
MCRCON_PATH="${MCRCON_PATH}"
MCRCON="${MCRCON_PATH}"

# Likely useless abstraction, once the TUI becomes multiple "pages" these may improve readability
MENU_LAYER_1_OPTIONS=""
MENU_LAYER_1=""

# Main TUI loop
while :
do
	# Clean up screen
	clear
	printf "MCR TUI WRAPPER\n1. LIST USERS\n2. SEND MESSAGE TO ALL USERS\n3. ACHIEVEMENTS MENU\n9. EXIT\n"
	read SELECTION_VAR
	case "$SELECTION_VAR" in
		# Case 1 lists all active users and quantity of users
		1) clear
			# Define OUTPUT variable to read the output of the list function
			OUTPUT=$(list 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		 ;;
		 # Case 2 sends a message to all users on the server as the server
		2) clear
			printf "Input text to send to all users: "
			read TEXT
			clear
			if OUTPUT=$(tellall 2>&1); then
				printf 'You sent the message: %s\n' "$OUTPUT"
			else
				printf 'Message not sent\n'
			fi
			wait_for_user
		 ;;
		3) 
			while :
			do
				clear
				printf "ACHIEVEMENTS MENU\n1. ACHIEVEMENT MANAGEMENT\n2. ACHIEVEMENT FETCHING\n9. EXIT\n"
				read ACH_SELECT_VAR
				case "$ACH_SELECT_VAR" in
					1) 
						while :
						do
							clear
							printf "ACHIEVEMENT MANAGEMENT\n1. GRANT\n2. REVOKE\n9. EXIT\n"
							read ACH_MGMT_VAR
							case "$ACH_MGMT_VAR" in
								1)
									while :
									do
										clear
										printf "ACHIEVEMENT GRANT MENU\n1. ONLY\n2. EVERYTHING\n9. EXIT\n"
										read ACH_GRT_VAR
										case "$ACH_GRT_VAR" in
											1) 
												printf "Input target player username: "
												read USER_NAME
												printf "Input advancement resource location: "
												read RESOURCE_LOCATION
												grant_only_achievement
												;;
											9) break ;;
											*) ;;
										esac

									done
									;;
								2) ;;
								9) break ;;
								*) ;;
							esac

						done

						;;
					2) ;;
					9) break ;;
					*) printf "Not an option" ;;
				esac
			done


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
