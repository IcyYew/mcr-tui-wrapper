#!/bin/sh

# Configure these based upon your RCON settings
RCON_HOST=""
RCON_PORT=""
# Set this as an env var rather than setting directly
RCON_PASSWORD=""

# Set path to mcrcon exe, if env then mcrcon (or whatever it's command is
MCRCON_PATH=""

# Easy typing lul
MCRCON="$MCRCON_PATH"

$MCRCON -H $RCON_HOST -p $RCON_PASSWORD list
