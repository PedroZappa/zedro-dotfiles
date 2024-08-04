#!/usr/bin/env bash
# set -euo pipefail

# Set Path to Obsidian Vault
if [[ $USER == "zedr0" ]]; then			# DEV-Desk
	OBSIDIAN_VAULT_PATH="$HOME/Documents/Obsidian/ZedroVault"
elif [[ $USER == "passunca" ]]; then	# 42
	OBSIDIAN_VAULT_PATH="$HOME/sgoinfre/Zedro-Vault"
elif [[ $USER == "zedro" ]]; then		# DEV-Mac
	OBSIDIAN_VAULT_PATH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/ZedroVault"
else
	echo "ZMUX: Unknown user... you shall not PATH! 😅"
fi

export OBSIDIAN_VAULT_PATH

I3SOCK=$(ls /run/user/1000/i3/ipc-socket.*)
export I3SOCK

# Session Name variables
SESH1="RC"
SESH2="DEV"

# Create RC session
tmux new-session	-d -s $SESH1
# Create .dotfiles RC window
tmux rename-window	-t RC:1 '.dotfiles'
tmux send-keys		-t RC:1 'cd $HOME/.dotfiles' C-m
tmux send-keys		-t RC:1 'git pull' C-m
tmux send-keys		-t RC:2 'glgs' C-m
tmux send-keys		-t RC:1 'nvim' C-m
# Create obsidian RC window
tmux new-window		-t RC:2 -n 'obsidian' -c $OBSIDIAN_VAULT_PATH
tmux send-keys		-t RC:2 'cd '$OBSIDIAN_VAULT_PATH C-m
if command -v eza &> /dev/null; then
	tmux send-keys	-t RC:2 'eza -al' C-m
else
	tmux send-keys		-t RC:2 'll' C-m
fi
tmux split-window	-t RC:2 -h 
tmux send-keys		-t RC:2 'cd '$OBSIDIAN_VAULT_PATH C-m
tmux send-keys		-t RC:2 'git pull' C-m
tmux send-keys		-t RC:2 'obsidian' C-m
# Create Monitoring RC window
tmux new-window		-t RC:3 -n 'ztop'
if command -v btop &> /dev/null; then
	tmux send-keys	-t RC:3 'btop' C-m
else
	tmux send-keys	-t RC:3 'htop' C-m 
fi

# Create DEV session
tmux new-session	-d -s $SESH2
# Create Working Project window
tmux rename-window	-t DEV:1 '...'
# Create Debug window
tmux new-window		-t DEV:2 -n 'DEBUG'
tmux split-window	-t DEV:2 -h
tmux resize-pane	-L 120

# Create SYNC window
tmux new-window		-t DEV:3 -n 'SYNC'

# Attach to DEV session
tmux attach-session -t DEV:1

# Open termina on i3 workspace2 and attach to DEV session
# i3-msg --socket=$I3SOCK exec i3-sensible-terminal

# i4-msg workspace 2; i3-msg exec i3-sensible-terminal
# tmux attach-session -t DEV
