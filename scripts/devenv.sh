#!/usr/bin/env bash
set -euo pipefail
# -e : Exit immediately if a command exits with a non-zero status;
# -u : Treat unset variables as an error and exit;
# -o pipeline : Set the exit status to the last command in the pipeline that failed.

# Dev Environment Setup
local BREW_PATH="$HOME/.local/bin"

# Check bash version for associative array support
if [ "${BASH_VERSINFO:-0}" -lt 4 ]; then
    echo "Error: This script requires bash version 4.0 or higher." >&2
    exit 1
fi

# Associative array defining source and target FILES
declare -A FILES
FILES=(
    ["$HOME/.dotfiles/.zshrc"]="$HOME/.zshrc"
    ["$HOME/.dotfiles/.zshenv"]="$HOME/.zshenv"
	["$HOME/.dotfiles/starship.toml"]="$HOME/.config/starship.toml"
    ["$HOME/.dotfiles/.gdbinit"]="$HOME/.gdbinit"
    ["$HOME/.dotfiles/.vimrc"]="$HOME/.vimrc"
    ["$HOME/.dotfiles/nvim"]="$HOME/.config/nvim"
    ["$HOME/.dotfiles/.tmux.conf.local"]="$HOME/.config/.tmux.conf.local"
    ["$HOME/.dotfiles/kitty/kitty.conf"]="$HOME/.config/kitty/kitty.conf"
    ["$HOME/.dotfiles/btop/btop.conf"]="$HOME/.config/btop/btop.conf"
)

create_symlink() {
    local SRC=$1
    local DEST=$2

    # Check if the destination file/directory exists
    if [ -e "$DEST" ]; then
        # If it exists, move it to a backup
        mv "$DEST" "${DEST}_bak"
        echo "Moved existing $DEST to ${DEST}_bak"
    fi
    # Create the parent directory if it doesn't exist
    mkdir -p "$(dirname "$DEST")"
    # Create the symlink
    ln -s "$SRC" "$DEST"
    echo "Created symlink from $SRC to $DEST"
}

install_brew() {
    echo "Homebrew not found. Do you want to install it? (y/n)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
		# Get Homebrew Package
        mkdir -p ~/.local/Homebrew &&
        curl -L https://github.com/Homebrew/brew/tarball/master |
        tar xz --strip 1 -C ~/.local/Homebrew
		# Link Binary to prefered PATH
        mkdir -p ${BREW_PATH} &&
        ln -s ~/.local/Homebrew/bin/brew ${BREW_PATH}
		# Source zshrc
		source $ZSHRC
		# Add Homebrew to PATH
        cat << 'EOF' >> ~/.zshrc [ -d "${BREW_PATH}" ] && 
		export PATH="${BREW_PATH}:$PATH"
		EOF
		echo "Homebrew installation complete."
    else
        echo "Homebrew installation skipped."
    fi
}

# Install Homebrew
if ! command -v brew &> /dev/null; then
    install_brew
else
    echo "Homebrew is already installed."
fi

# Create symlinks
for SRC in "${!FILES[@]}"; do
    DEST=${FILES[$SRC]}
    create_symlink "$SRC" "$DEST"
done
