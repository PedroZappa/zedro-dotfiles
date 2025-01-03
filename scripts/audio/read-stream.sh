#!/usr/bin/env bash
# set -euo pipefail
# -e : Exit immediately if a command exits with a non-zero status;
# -u : Treat unset variables as an error and exit;
# -o pipeline : Set the exit status to the last command in the pipeline that failed.

# Load Colors
source ~/.dotfiles/scripts/colors.sh

# Set default env
IP2SEND=192.168.1.169 # IP to send to
DEST_USER=zedro				# User to send to
DEST_PATH="~/"				# Destination path
PORT=3333							# Port to send audio stream

# Stream Settings
N_CH=2 # Number of channels
RATE=44100 # Bit Rate
INTERFACE=default
CODEC=pcm_s16le 

ffmpeg -analyzeduration 0 -probesize 100 \
    -protocol_whitelist "file,udp,rtp" \
    -i ~/stream.sdp -f sdl "RTP Stream"
