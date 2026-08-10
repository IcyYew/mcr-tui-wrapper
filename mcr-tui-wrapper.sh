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



list() {
	"$MCRCON" -H "$RCON_HOST" -p "$RCON_PASSWORD" list
}
