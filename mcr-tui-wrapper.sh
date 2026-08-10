#!/bin/sh

. ./.env
. ./mcrw-functions.lib
#
#
# 	ENV VARS
#
#

# Variable definitions for visibility, all are actually sourced from .env, if you do not have a .env run init.sh and input your values
RCON_HOST="${RCON_HOST}"
RCON_PORT="${RCON_PORT}"
RCON_PASSWORD="${RCON_PASSWORD}"
MCRCON_PATH="${MCRCON_PATH}"
MCRCON="${MCRCON_PATH}"

while :
do
	clear
	printf "MCR TUI WRAPPER\n1. LIST USERS\n2. SEND MESSAGE TO ALL USERS\n9. EXIT\n"
	read SELECTION_VAR
	case "$SELECTION_VAR" in
		1) clear
			OUTPUT=$(list 2>&1)
			printf '%s\n' "$OUTPUT"
			wait_for_user
		 ;;
		2) clear
			printf "Input text to send to all users: "
			read TEXT
			OUTPUT=$(tellall 2>&1)
			clear
			if [ "$OUTPUT" = 0 ]; then
				printf "\nMessage not sent"
				wait_for_user
			else
				printf 'You sent the message: %s\n' "$OUTPUT"
				wait_for_user
			fi

		 ;;
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
