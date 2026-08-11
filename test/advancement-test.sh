#!/bin/sh

. ./libs/test.lib


PASS=0
FAIL=0

# test grant every advancement with player target identifier
[ $(neutered_advancements_function "grant" "@a" "everything") = "advancement grant @a everything" ] && PASS=PASS+1 || FAIL=FAIL+1 
