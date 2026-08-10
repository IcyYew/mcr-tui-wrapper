#!/bin/sh

# init env vars for mcrcon tui wrapper


printf "Input RCON Hostname (ex. 127.0.0.1 || yourhost.com): "
read RCON_HOST

printf "Input RCON Port (ex. 25575): "
read RCON_PORT

printf "Input RCON Password (ex. password): "
read RCON_PASSWORD

printf "Input mcrcon Path (ex. /path/to/mcrcon.sh): "
read MCRCON_PATH

# Write .env file with env vars (overwrite if already exists) 
printf "RCON_HOST='${RCON_HOST}'\nRCON_PORT='${RCON_PORT}'\nRCON_PASSWORD='${RCON_PASSWORD}'\nMCRCON_PATH='${MCRCON_PATH}'" > .env
