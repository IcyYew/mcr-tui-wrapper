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

list() {
	"$MCRCON" -H "$RCON_HOST" -p "$RCON_PASSWORD" list
}

if [ -z "$COMMAND" ]; then
	echo "ERR: NO CMD"
	exit 1
fi

case "$COMMAND" in
	"users")
		list
		;;
	*)
		echo "Fallback"
		exit 1
		;;
esac

