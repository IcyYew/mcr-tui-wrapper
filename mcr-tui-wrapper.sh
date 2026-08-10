#!/bin/sh

. ./.env

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

#
#
# Mostly placeholder command handling for proof of concept
#
#

# No command handling
if [ -z "$COMMAND" ]; then
	echo "ERR: NO CMD"
	echo "Viable opts: [ ${OPTS_LIST} ]"
	exit 1
fi

# Case for different commands, again mostly placeholder prior to TUI
case "$COMMAND" in
	"users")
		list
		;;
	"tellall")
		tellall
		;;
	*)
		echo "Fallback"
		echo "Viable opts: [ ${OPTS_LIST} ]"
		exit 1
		;;
esac

