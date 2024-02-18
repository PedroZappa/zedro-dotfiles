#################
### Setup Env ###
#################

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Set language
export LANG=en_US.UTF-8

# Add ~/.local/bin to PATH
export PATH="$HOME/.local/bin:$PATH"

##########################
### Setup Default Apps ###
##########################

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="chromium"

# Obsidian
alias obsidian=~/bin/Obsidian-1.4.16.AppImage
# Glow Markdown Renderer
alias glow=~/bin/glow/glow
# kitty at 42
if [[ $USER == "passunca" ]]; then
	alias kitty=~/.local/kitty.app/bin/kitty
fi

# CARGO
. "$HOME/.cargo/env"

###################
### Clean up ~/ ###
###################

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

########################################
# Load Version Manager (for Node.js) ###
########################################
#
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
