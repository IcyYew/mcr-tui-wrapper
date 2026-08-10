#!/bin/sh

. ./.env

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

# Placeholder arguments prior to TUI implementation
COMMAND=$1
OPTS=$2

#
#
#  	FUNCTION DEFINITIONS
#
#

# rcon function for base mcrcon calls, uses env vars and one input argument (the mc server command to be executed)
rcon() {
	"$MCRCON" \
		-H "$RCON_HOST" \
		-p "$RCON_PASSWORD" \
		"$1"
}

# List number of users on the server along with their usernames, calls to rcon function with list passed as argument
list() {
	rcon 'list'
}

# Send a message to all users on the server as server, calls to rcon function with defined "tellall" tellraw passed as argument, OPTS var is passed
# via cli and defines the message itself
tellall() {
	rcon 'tellraw @a {"text":"[Server] ","bold":true,"color":"gold","extra":[{"text":"'${OPTS}'","color":"yellow","bold":false,"italic":true}]}'
}

#
#
# Mostly placeholder command handling for proof of concept
#
#

# No command handling
if [ -z "$COMMAND" ]; then
	echo "ERR: NO CMD"
	echo "Viable opts: [ users ]"
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
		echo "Viable opts: [ users ]"
		exit 1
		;;
esac

