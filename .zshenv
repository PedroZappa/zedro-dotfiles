#################
### Setup Env ###
#################

export LANG=en_US.UTF-8

export PATH="$HOME/.local/bin:$PATH"

##########################
### Setup Default Apps ###
##########################

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="chromium"

. "$HOME/.cargo/env"

###################
### Clean up ~/ ###
###################
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
