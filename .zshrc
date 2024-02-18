###############
### General ###
###############

# Load colors
autoload colors && colors
for COLOR in RED GREEN YELLOW BLUE MAGENTA CYAN BLACK WHITE; do
   eval $COLOR='$fg_no_bold[${(L)COLOR}]'
   eval BOLD_$COLOR='$fg_bold[${(L)COLOR}]'
done
eval NC='$reset_color'

# Load and initialise completion system
autoload -Uz compinit
compinit

#################
### Setup Env ###
#################
export LANG=en_US.UTF-8

export PATH="$HOME/.local/bin:$PATH"

[ -z "$EDITOR" ] && EDITOR=vim

################
### Greeting ###
################
echo "ꔘ ꔘ ꔘ Yo ${CYAN}$USER!${NC} Welcome to ${MAGENTA}$HOST${NC} ꔘ ꔘ ꔘ"

#######################
### Zedro's Aliases ###
#######################

# Zmux kickstart
alias zmux=~/C0D3/z-scripts/zmux-start.sh
alias xmux=~/C0D3/z-scripts/zmux-kill.sh
alias zshcow=~/C0D3/z-scripts/zsh-cowsay.sh

# Compiling
alias ccw='cc -Wall -Wextra -Werror -g'

# 42 Norm Check
alias nn='norminette'
# Franinette alias
alias francinette=~/francinette/tester.sh
alias fr='francinette'

# git
alias ga='git add'
alias gst='git status'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gco='git checkout'
alias gcb='git checkout -b'
alias glgg='git log --graph --oneline --decorate'
alias glgs='git log --graph --oneline --decorate | head -n 7'

# Navigation
if command -v eza > /dev/null 2>&1; then
	echo "====> Running ${GREEN}eza${NC}! 📊"
	alias ls='eza'
	alias ll='eza -laZ --total-size'
	alias llg='eza -laZ --total-size --git --git-repos'
else
	echo "====> Running ${YELLOW}ls${NC}! "
	alias ll='ls -al --color'
fi

# Obsidian
alias obsidian=~/bin/Obsidian-1.4.16.AppImage

# Glow Markdown Renderer
alias glow=~/bin/glow/glow

# kitty at 42
if [[ $USER == "passunca" ]]; then
	alias kitty=~/.local/kitty.app/bin/kitty
fi

##########################
### Zap Plugin Manager ###
##########################
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
plug "zap-zsh/web-search"

if command -v lolcat > /dev/null 2>&1; then
	eval "zshcow" | lolcat
else
	eval "zshcow"
fi

# Load Starship
if command -v starship > /dev/null 2>&1; then
    eval "$(starship init zsh)"
else
    ZSH_THEME="refined"
fi


# Load Version Manager (for Node.js)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

