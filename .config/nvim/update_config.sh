#!/bin/bash

DIR="$HOME/.config/nvim"
INIT_FILE="./init.lua"
LUA_DIR="./lua"
KICKSTART_DIR="./kickstart"

echo "$(cp $INIT_FILE $DIR)"

echo "$(cp -r $LUA_DIR $DIR)"
