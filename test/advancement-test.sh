#!/bin/sh

. ./libs/advancements.lib

rcon() {
	printf '%s\n' "$1"
}


PASS=0
FAIL=0

# test grant every advancement with player target identifier
OUTPUT=$(advancements_function "grant" "@a" "everything")
[ "$OUTPUT" = "advancement grant @a everything" ] && PASS=$((PASS + 1)) || FAIL=$((FAIL + 1))

# test grant only advancement
OUTPUT=$(advancements_function "grant" "@a" "only" "minecraft:story/shiny_gear")
[ "$OUTPUT" = "advancement grant @a everything minecraft:story/shiny_gear" ] && PASS=$((PASS + 1)) || FAIL=$((FAIL + 1))

# test grant from advancement

printf "PASS: $PASS\nFAIL: $FAIL\n"
