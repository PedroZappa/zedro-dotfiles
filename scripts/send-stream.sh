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

# Parse command-line arguments
while getopts "u:i:p:" opt; do
  case $opt in
    u) DEST_USER=$OPTARG ;;  # Set destination user
    i) IP2SEND=$OPTARG ;;    # Set IP address
		p) PORT=$OPTARG ;;			 # Set port
    *) echo "Usage: ${YEL}$0 [-u user] [-i IP] [-p port]${D}"; exit 1 ;;
  esac
done

# Check if running inside tmux
if [ -z "$TMUX" ]; then
  echo "${RED}Error: This script must be run inside a tmux session.${D}"
  exit 1
fi

# Stream Settings
N_CH=2 # Number of channels
RATE=44100 # Bit Rate
INTERFACE=default
CODEC=pcm_s16le 

cmd=$(cat << EOF
	ffmpeg -f alsa -ac $N_CH -ar $RATE -i $INTERFACE -acodec $CODEC \
		-f rtp rtp://$IP2SEND:$PORT -sdp_file stream.sdp
EOF
)

# Generate the RTP stream and SDP file
tmux set-option remain-on-exit on
# tmux split-window -h ${cmd}
tmux split-window -h "$cmd"

# Transfer the SDP file in a new tmux pane
echo -e "${MAG} Transfering stream information to Receiver:${D}" 
sleep 1 && scp stream.sdp $DEST_USER@$IP2SEND:$DEST_PATH
