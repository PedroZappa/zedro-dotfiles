ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also sgit clone https://github.com/dylanaraps/neofetchet it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765) 
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"


# Zap Plugin Manager
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "hlissner/zsh-autopair"
plug "zsh-users/zsh-history-substring-search"
plug "MichaelAquilina/zsh-you-should-use"
plug "zap-zsh/completions"
plug "zap-zsh/sudo"
plug "web-search"
plug "zap-zsh/fzf"

# Load and initialise completion system
autoload -Uz compinit
compinit

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export GIT_EDITOR=nvim


# kitty-tmux kickstart
#!/bin/bash

# Check if there are any tmux sessions
if [ -z "$(tmux list-sessions 2>/dev/null)" ]; then
   echo "|=== Loading 󰄛 +   ===|"
   ~/C0D3/z-scripts/kitty-tmux-starter.sh
else
   echo "|===|===|=== ZMUX ===|===|===|"
fi



### Zedro's Aliases
#
# Git
alias ga='git add'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glgg='git log --graph --oneline --decorate'
# Navigation
alias ll='ls -al --color'
# Compiling
alias ccw='cc -Wall -Wextra -Werror -g'
# 42 Norm Check
alias nn='norminette'
# Franinette alias
alias fr='francinette'

alias francinette=~/francinette/tester.sh
alias paco=~/francinette/tester.sh

alias obsidian=~/bin/Obsidian-1.4.16.AppImage

# Local Aliases
echo "ꔘ ꔘ ꔘ Yo $USER! Welcome to $HOST ꔘ ꔘ ꔘ"
if [[ $USER == "zedr0" ]]; then
	# export PATH=$PATH:/bin/nvim-linux64/bin:$PATH
	alias nvim=~/bin/nvim-linux64/bin/nvim
else [[ $USER == "passunca" ]];
	alias kitty=~/.local/kitty.app/bin/kitty
fi

# Load Version Manager (for Node.js)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Starship
if command -v starship > /dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    ZSH_THEME="refined"
fi

# Load Neofetch
if command -v neofetch > /dev/null 2>&1; then
	neofetch
fi
