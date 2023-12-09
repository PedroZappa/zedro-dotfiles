ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also sgit clone https://github.com/dylanaraps/neofetchet it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765) 
COMPLETION_WAITING_DOTS="true"

# DISABLE_UNTRACKED_FILES_DIRTY="true"
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

# You may need to manually set your language environment
export LANG=en_US.UTF-8


### Zedro's Aliases
#
# Local Aliases
echo "ꔘ ꔘ ꔘ Yo $USER! Welcome to $HOST ꔘ ꔘ ꔘ"
if [[ $USER == "passunca" ]]; then
	alias kitty=~/.local/kitty.app/bin/kitty
fi
# kitty-tmux kickstart
alias zmux=~/C0D3/z-scripts/kitty-tmux-starter.sh
# setup lscolors
source C0D3/z-scripts/lscolors.sh

# git
alias ga='git add'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push'
alias gpl='git push & glgg'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glgg='git log --graph --oneline --decorate'

# Navigation
if command -v lsd &> /dev/null; then
	alias ls='lsd'
	alias ll='lsd -al'
	alias lt='lsd --tree'
else
	alias ll='ls -al --color'
fi

# Compiling
alias ccw='cc -Wall -Wextra -Werror -g'

# 42 Norm Check
alias nn='norminette'
# Franinette alias
alias fr='francinette'
alias francinette=~/francinette/tester.sh
alias paco=~/francinette/tester.sh

# Obsidian
alias obsidian=~/bin/Obsidian-1.4.16.AppImage

# Glow Markdown Renderer
alias glow=~/bin/glow/glow

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
