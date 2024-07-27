#!/usr/bin/env bash
set -euo pipefail
# -e : Exit immediately if a command exits with a non-zero status;
# -u : Treat unset variables as an error and exit;
# -o pipeline : Set the exit status to the last command in the pipeline that failed.

# Dev Environment Setup
BREW_PATH="$HOME/.local/bin"

# Check bash version for associative array support
if [ "${BASH_VERSINFO:-0}" -lt 4 ]; then
    echo "Error: This script requires bash version 4.0 or higher." >&2
    exit 1
fi

# Associative array defining source and target FILES
declare -A FILES
FILES=(
    ["$HOME/.dotfiles/.bashrc"]="$HOME/.bashrc"
    ["$HOME/.dotfiles/.gitconfig"]="$HOME/.gitconfig"
    ["$HOME/.dotfiles/.zshrc"]="$HOME/.zshrc"
    ["$HOME/.dotfiles/.zshenv"]="$HOME/.zshenv"
    ["$HOME/.dotfiles/.gdbinit"]="$HOME/.gdbinit"
	["$HOME/.dotfiles/starship.toml"]="$HOME/.config/starship.toml"
    ["$HOME/.dotfiles/.vimrc"]="$HOME/.vimrc"
    ["$HOME/.dotfiles/nvim"]="$HOME/.config/nvim"
    ["$HOME/.dotfiles/.tmux.conf.local"]="$HOME/.config/.tmux.conf.local"
    ["$HOME/.dotfiles/kitty/kitty.conf"]="$HOME/.config/kitty/kitty.conf"
    ["$HOME/.dotfiles/btop/btop.conf"]="$HOME/.config/btop/btop.conf"
)

# Associative array defining Homebrew packages to install
declare -A BREW_PACKAGES
BREW_PACKAGES=(
    ["btop"]="Btop"
    ["lnav"]="Lnav"
    ["lazygit"]="Lazygit"
    ["nvim"]="Neovim"
    ["starship"]="Starship"
)

# Install Homebrew
install_brew_packages() {
    for package in "${!BREW_PACKAGES[@]}"; do
        brew install "$package"
        echo "Installed ${BREW_PACKAGES[$package]}"
    done
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
        cat << 'EOF' >> ~/.zshrc [ -d "${BREW_PATH}" ] && export PATH="${BREW_PATH}:$PATH"
		EOF
		echo "Homebrew installation complete."
		# Ask to install Homebrew packages
        echo "Do you want to install Homebrew packages now? (y/n)"
        read -r install_packages
        if [[ "$install_packages" =~ ^[Yy]$ ]]; then
            install_brew_packages
        fi
    else
        echo "Homebrew installation skipped."
    fi
}

if ! command -v brew &> /dev/null; then
    install_brew
else
    echo "Homebrew is already installed."
fi

install_oh_my_tmux() {
    echo "Installing oh-my-tmux..."
    cd "$HOME"
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    cp .tmux/.tmux.conf.local .
    echo "oh-my-tmux installation complete."
}

# Install oh-my-tmux
echo "Do you want to install oh-my-tmux now? (y/n)"
read -r install_tmux
if [[ "$install_tmux" =~ ^[Yy]$ ]]; then
    install_oh_my_tmux
fi

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

# Create symlinks
echo "Do you want to create symlinks to .dotfiles now? (y/n)"
read -r create_symlinks
if [[ "$create_symlinks" =~ ^[Yy]$ ]]; then
	for SRC in "${!FILES[@]}"; do
		DEST=${FILES[$SRC]}
		create_symlink "$SRC" "$DEST"
	done
fi

echo "${USER} Dev Environment Setup complete."
