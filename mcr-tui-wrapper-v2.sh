#!/bin/sh

. ./.env
. ./mcrw-functions.lib
#
#
# 	ENV VARS
#
#

# Temporary list of options for easy adding prior to TUI
OPTS_LIST="users, tellall"

# Variable definitions for visibility, all are actually sourced from .env, if you do not have a .env run init.sh and input your values
RCON_HOST="${RCON_HOST}"
RCON_PORT="${RCON_PORT}"
RCON_PASSWORD="${RCON_PASSWORD}"
MCRCON_PATH="${MCRCON_PATH}"
MCRCON="${MCRCON_PATH}"

SELECTION_VAR=1
while [ $SELECTION_VAR -ne 9 ]
do
	clear
	printf "MCR TUI WRAPPER\n1. LIST USERS\n2. SEND MESSAGE TO ALL USERS\n9. EXIT\n"
	read SELECTION_VAR
	case "$SELECTION_VAR" in
		1) clear
			list 
			sleep 5
		 ;;
		2) clear
			printf '[PID %s] Input text to send to all users: ' "$$"
			read TEXT
			tellall
		 ;;
	 	9) clear
			printf "Bye bye! o/\n"
		;;
		*) clear
			printf "Not implemented\n"
			sleep 5
		;;
	esac
done
