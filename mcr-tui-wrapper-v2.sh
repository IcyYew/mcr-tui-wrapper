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

# Placeholder arguments prior to TUI implementation
COMMAND=$1
OPTS=$2

SELECTION_VAR=1

while [ $SELECTION_VAR -ne 9 ]
do
	printf "MCR TUI WRAPPER\n1. LIST USERS\n2. SEND MESSAGE TO ALL USERS\n9. EXIT\n"
	read SELECTION_VAR
	case $SELECTION_VAR in
		1) list ;;
		2) tellall ;;
		*) printf "Not implemented\n" ;;
	esac
done
