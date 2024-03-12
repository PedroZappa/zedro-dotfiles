#!/usr/bin/env bash

pid=$(pidof simplescreenrecorder)

if [ -n "$pid" ]; then
	kill $pid
else
	echo "simplescreenrecorder is not running"
fi
