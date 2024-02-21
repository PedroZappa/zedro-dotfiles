#!/bin/bash
# Auto Compiler powered by entr
# https://eradman.com/entrproject/

# If process already running, kill it and exit
pkill -f "entr compiler" && exit
# Start compiling process
echo "$1" | entr compile "$1"
