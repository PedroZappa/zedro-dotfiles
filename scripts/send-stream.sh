#!/usr/bin/env bash
# set -euo pipefail
# -e : Exit immediately if a command exits with a non-zero status;
# -u : Treat unset variables as an error and exit;
# -o pipeline : Set the exit status to the last command in the pipeline that failed.

# Load Colors
source ~/.dotfiles/scripts/colors.sh

# Set env
export IP2SEND=192.168.1.169
export DEST_USER=zedro
DEST_PATH="~/" # Destination path
PORT=3333 # Port to send audio stream

# Stream Settings
N_CH=2 # Number of channels
RATE=44100 # Bit Rate
INTERFACE=default
CODEC=pcm_s16le 

# Check if running inside tmux
if [ -z "$TMUX" ]; then
  echo "${RED}Error: This script must be run inside a tmux session.${D}"
  exit 1
fi

# Pass environment variables to tmux session
tmux set-environment -g IP2SEND $IP2SEND
tmux set-environment -g DEST_USER $DEST_USER
tmux set-environment -g DEST_PATH $DEST_PATH
tmux set-environment -g PORT $PORT
tmux set-environment -g N_CH $N_CH
tmux set-environment -g RATE $RATE
tmux set-environment -g INTERFACE $INTERFACE
tmux set-environment -g CODEC $CODEC

cmd='ffmpeg -f alsa -ac $N_CH -ar $RATE -i $INTERFACE -acodec $CODEC \
	-f rtp rtp://$IP2SEND:$PORT -sdp_file stream.sdp'

# Generate the RTP stream and SDP file
tmux set-option remain-on-exit on
# tmux split-window -h ${cmd}
tmux split-window -h "$cmd"

# Transfer the SDP file in a new tmux pane
echo -e "${MAG} Transfering stream information to Receiver:${D}" 
sleep 1 && scp stream.sdp $DEST_USER@$IP2SEND:$DEST_PATH
