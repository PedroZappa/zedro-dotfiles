#!/bin/bash

# Get PID of minitalk server
PID_LIST=$(ps aux | grep -w "./server" | grep -v grep)
# Check if the if the 6th field of the list is 960 
awk '{ if ($6 == "960") print $2 }' <<< "$PID_LIST"

