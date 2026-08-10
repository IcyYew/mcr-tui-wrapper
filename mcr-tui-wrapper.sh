#!/bin/sh

. ./.env

# Can be configured automatically via init or manually if you wish
RCON_HOST="${RCON_HOST}"
RCON_PORT="${RCON_PORT}"
# Set this as an env var rather than setting directly
RCON_PASSWORD="${RCON_PASSWORD}"

# Set path to mcrcon exe, if env then mcrcon (or whatever it's command is
MCRCON_PATH="${MCRCON_PATH}"

MCRCON="${MCRCON_PATH}"

COMMAND=$1
OPTS=$2

rcon() {
	"$MCRCON" \
		-H "$RCON_HOST" \
		-p "$RCON_PASSWORD" \
		$1
}

list() {
	rcon 'list'
}

tellall() {
	rcon 'tellraw @a {"text":"[Server] ","bold":true,"color":"gold","extra":[{"text":"${OPTS}","color":"yellow","bold":false,"italic":true}]}'
}

if [ -z "$COMMAND" ]; then
	echo "ERR: NO CMD"
	echo "Viable opts: [ users ]"
	exit 1
fi

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

