#!/bin/sh

# Can be configured automatically via init or manually if you wish
RCON_HOST="${RCON_HOST}"
RCON_PORT="${RCON_PORT}"
# Set this as an env var rather than setting directly
RCON_PASSWORD="${RCON_PASSWORD}"

# Set path to mcrcon exe, if env then mcrcon (or whatever it's command is
MCRCON_PATH="${MCRCON_PATH}"

# Automatic exporting ON
set -a

# Take in init.sh output
eval "$(./init.sh)"

# Automatic exporting OFF
set +a

MCRCON="${MCRCON_PATH}"

$MCRCON -H $RCON_HOST -p $RCON_PASSWORD list
