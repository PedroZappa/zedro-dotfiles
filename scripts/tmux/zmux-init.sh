#!/bin/bash

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

# Create RC session
tmux new-session	-d -s RC
# Create .dotfiles RC window
tmux rename-window	-t RC:1 '.dotfiles'
tmux send-keys		-t RC:1 'cd $HOME/.dotfiles' C-m
tmux send-keys		-t RC:1 'git pull' C-m
tmux send-keys		-t RC:2 'glgs' C-m
tmux send-keys		-t RC:1 'nvim' C-m
# Create z-scripts RC window
tmux new-window		-t RC:2 -n 'z-scripts'
tmux send-keys		-t RC:2 'cd $HOME/C0D3/z-scripts' C-m
tmux send-keys		-t RC:2 'git pull' C-m
tmux send-keys		-t RC:2 'glgs' C-m
tmux send-keys		-t RC:2 'nvim' C-m
# Create obsidian RC window
tmux new-window		-t RC:3 -n 'obsidian' -c $OBSIDIAN_VAULT_PATH
tmux send-keys		-t RC:3 'cd '$OBSIDIAN_VAULT_PATH C-m
if command -v eza &> /dev/null; then
	tmux send-keys	-t RC:3 'eza -al' C-m
else
	tmux send-keys		-t RC:3 'll' C-m
fi
tmux split-window	-t RC:3 -h 
tmux send-keys		-t RC:3 'cd '$OBSIDIAN_VAULT_PATH C-m
tmux send-keys		-t RC:3 'git pull' C-m
tmux send-keys		-t RC:2 'glgs' C-m
tmux send-keys		-t RC:3 'obsidian' C-m
# Create Monitoring RC window
tmux new-window		-t RC:4 -n 'ztop'
if command -v btop &> /dev/null; then
	tmux send-keys	-t RC:4 'btop' C-m
else
	tmux send-keys	-t RC:4 'htop' C-m 
fi

# Create DEV session
tmux new-session	-d -s DEV
tmux attach-session -t DEV:1
tmux new-window		-t DEV:2 -n 'DEBUG'

# Open termina on i3 workspace2 and attach to DEV session
i3-msg --socket=$I3SOCK exec i3-sensible-terminal

# i4-msg workspace 2; i3-msg exec i3-sensible-terminal
# tmux attach-session -t DEV
