#!/bin/sh

# init env vars for mcrcon tui wrapper


printf "Input RCON Hostname (ex. 127.0.0.1 || yourhost.com): "
read RCON_HOST

printf "Input RCON Port (ex. 25575): "
read RCON_PORT

printf "Input RCON Password (ex. password): "
read RCON_PASSWORD

printf "Input mcrcon Path (ex. /path/to/mcrcon.sh)"
read MCRCON_PATH

declare -p RCON_HOST RCON_PORT RCON_PASSWORD MCRCON_PATH
