#!/bin/bash
#
VALGRIND_PIDS=$(ps aux | grep valgrind.bin | grep -v grep | awk '{print $2}')
COUNT=$(echo "$VALGRIND_PIDS" | wc -l)

if [ $COUNT -eq 1 ]; then
	echo "$VALGRIND_PIDS"
elif [ $COUNT -gt 1 ]; then
	echo "⚔$COUNT"
fi

