#!/usr/bin/env bash
set -euo pipefail
# -e : Exit immediately if a command exits with a non-zero status;
# -u : Treat unset variables as an error and exit;
# -o pipeline : Set the exit status to the last command in the pipeline that failed.

### Dev Environment Setup
# Sources:
# Brew without sudo
# https://nelsonaloysio.medium.com/installing-homebrew-without-sudo-5e708a929522

# Check bash version for associative array support
if [ "${BASH_VERSINFO:-0}" -lt 4 ]; then
    echo "Error: This script requires bash version 4.0 or higher." >&2
    exit 1
fi

# Ensure git, curl and wget are installed
command_exists() {
    command -v "$1" &> /dev/null
}

if ! command_exists git; then
    echo "Error: git is not installed. Please install git to proceed." >&2
    exit 1
fi

if ! command_exists curl; then
    echo "Error: curl is not installed. Please install curl to proceed." >&2
    exit 1
fi

if ! command_exists wget; then
	echo "Error: wget is not installed. Please install wget to proceed." >&2
	exit 1
fi

# Express installation
# Check for --express argument
EXPRESS_INSTALL=false
if [[ $# -gt 0 && "$1" == "--express" ]]; then
    EXPRESS_INSTALL=true
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
    ["$HOME/.dotfiles/.tmux.conf.local"]="$HOME/.tmux.conf.local"
    ["$HOME/.dotfiles/kitty/kitty.conf"]="$HOME/.config/kitty/kitty.conf"
    ["$HOME/.dotfiles/btop/btop.conf"]="$HOME/.config/btop/btop.conf"
    ["$HOME/.dotfiles/atuin/config.toml"]="$HOME/.config/atuin/config.toml"
)

# Associative array defining Homebrew packages to install
declare -A BREW_PACKAGES
BREW_PACKAGES=(
    ["btop"]="Btop"
    ["lnav"]="Lnav"
    ["lazygit"]="Lazygit"
    ["nvim"]="Neovim"
    ["rg"]="Ripgrep"
    ["starship"]="Starship"
    ["atuin"]="Atuin"
    ["cowsay"]="Cowsay"
    ["fortune"]="Fortune"
    ["lolcat"]="Lolcat"
    ["eza"]="Eza"
)

clone_dotfiles() {
	if [[ ! -d "$HOME/.dotfiles" ]]; then
		cd "$HOME"
		git clone https://github.com/PedroZappa/zedro-dotfiles ./.dotfiles
		echo ".dotfiles repository successfully cloned. 󰩑 "
	fi
}

echo "Starting Dev Environment Setup"
if [[ "$EXPRESS_INSTALL" == false ]]; then
    echo "Do you want to clone Zedro's .dotfiles repository? (y/n)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
		if [ ! -d "$HOME/.dotfiles" ]; then
			clone_dotfiles
		else
			cd "$HOME/.dotfiles"
			git pull
			echo ".dotfiles repository up to date. 󰩑 "
		fi
    fi
else
	if [ ! -d "$HOME/.dotfiles" ]; then
		clone_dotfiles
	else
		cd "$HOME/.dotfiles"
		git pull
		echo ".dotfiles repository up to date. 󰩑 "
	fi
fi

# Get FiraCode font
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip"
FONT_DIR="$HOME/.local/share/fonts"
TEMP_DIR="$(mktemp -d)"
FONT_NAME="FiraCode"

get_firacode() {
	# Create temporary directory
	if [ ! -d "$FONT_DIR" ]; then
		mkdir -p "$FONT_DIR"
	fi
	echo "Downloading $FONT_NAME Nerd Font..."
	wget -qO "$TEMP_DIR/$FONT_NAME.zip" "$FONT_URL"
	echo "Unzipping the font..."
	unzip -q "$TEMP_DIR/$FONT_NAME.zip" -d "$TEMP_DIR"
	echo "Installing the font..."
	mv "$TEMP_DIR"/*.ttf "$FONT_DIR/"
	echo "Updating the font cache..."
	fc-cache -fV
	# Clean up
	rm -rf "$TEMP_DIR"
	echo "$FONT_NAME Nerd Font installed successfully!"
}

if [[ "$EXPRESS_INSTALL" == false ]]; then
	echo "Do you want to install FiraCode font now? (y/n)"
	read -r install_firacode
	if [[ "$install_firacode" =~ ^[Yy]$ ]]; then
		get_firacode
	fi
else
	get_firacode
fi

# Install Homebrew
BREW_PATH="$HOME/.local/bin"

install_brew() {
    if [[ "$EXPRESS_INSTALL" == false ]]; then
        echo "Homebrew not found. Do you want to install it? (y/n)"
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            echo "Homebrew installation skipped."
            return
        fi
        # Prompt user to choose installation method
        echo "Choose Homebrew installation method:"
        echo "(1) Custom Installation @${BREW_PATH}"
        echo "(2) Official Installation Script"
        read -r install_method
        case $install_method in
            1)
                # Custom Installation
                mkdir -p ~/.local/Homebrew &&
                curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ~/.local/Homebrew
                # Link Binary to preferred PATH
                mkdir -p ${BREW_PATH} &&
                ln -s ~/.local/Homebrew/bin/brew ${BREW_PATH}
                ;;
            2)
                # Official Installation Script
                /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
                echo "Homebrew installed using official script."
                ;;
            *)
                echo "Invalid option selected. Continuing..."
                return 1
                ;;
        esac
    else
        echo "Express install mode enabled. Skipping Homebrew installation prompt."
    fi
}

uninstall_brew() {
	if [[ -f "${BREW_PATH}/brew" ]]; then
        echo "Custom Homebrew installation found. Uninstalling..."
        rm -f "${BREW_PATH}/brew"
        echo "Custom Homebrew uninstalled."
    elif command -v brew &> /dev/null; then
        echo "Homebrew installed using official script found. Uninstalling..."
        rm -f "/home/linuxbrew/.linuxbrew/bin/brew"
        echo "Homebrew uninstalled."
    else
        echo "No Homebrew installation found."
    fi
}

if [[ "$EXPRESS_INSTALL" == false ]]; then
	echo "Choose an option:"
	echo "(1) Install Homebrew"
	echo "(2) Uninstall Homebrew"
	read -r choice

	case $choice in
		1)
			if ! command -v brew &> /dev/null; then
				install_brew
			else
				echo "Homebrew is already installed. 🖒 "
			fi
			;;
		2)
			uninstall_brew
			;;
		*)
			echo "Invalid option selected. Exiting..."
			;;
	esac
else
	install_brew
fi

# if ! command -v brew &> /dev/null; then
#     install_brew
# else
#     echo "Homebrew is already installed. 🖒 "
# fi

# Ask to install Homebrew packages
install_brew_packages() {
    for package in "${!BREW_PACKAGES[@]}"; do
		echo "Installing ${BREW_PACKAGES[$package]}... 🮲"
        brew install "$package" --force-bottle
        echo "Installed ${BREW_PACKAGES[$package]} 🤙"
    done
	# List installed Homebrew packages
	echo "Installed Homebrew packages 🍺:"
	brew list
}

echo "Do you want to install Homebrew packages now? (y/n)"
if [[ "$EXPRESS_INSTALL" == false ]]; then
	read -r install_packages
	if [[ "$install_packages" =~ ^[Yy]$ ]]; then
		install_brew_packages
	fi
else
	install_brew_packages
fi

# Install zap, zsh's Package Manager
ZAP_DIR="$HOME/.local/share/zap"

install_zap() {
	echo "Installing zap: zsh's Package Manager..."
	zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
	echo "zap installation complete. 🤙"
}

if [[ "$EXPRESS_INSTALL" == false ]]; then
	echo "Do you want to install zap now? (y/n)"
	read -r install_zap
	if [[ "$install_zap" =~ ^[Yy]$ ]]; then
		if [[ ! -d "$ZAP_DIR" ]]; then
			install_zap
		else
			echo "zap already installed. 🤙"
		fi
	fi
else
	install_zap
fi

# Install vim-plug
install_vim_plug() {
	echo "Installing vim-plug..."
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	# Create vim directories
	mkdir -p ~/.vim ~/.vim/autoload ~/.vim/backup ~/.vim/colors ~/.vim/plugged
	# Install color scheme
	cd ~/.vim/colors
	curl -o molokai.vim https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim
	curl -o dracula.vim https://raw.githubusercontent.com/dracula/vim/210e0961b9bd765b5b46a84d0631271ee8e6af64/colors/dracula.vim
	echo "vim-plug installation complete."
}

if [[ "$EXPRESS_INSTALL" == false ]]; then
	echo "Do you want to install vim-plug now? (y/n)"
	read -r install_vim_plug
	if [[ "$install_vim_plug" =~ ^[Yy]$ ]]; then
		install_vim_plug
	fi
else
	install_vim_plug
fi

# Install oh-my-tmux
install_oh_my_tmux() {
    echo "Installing oh-my-tmux..."
	if [[ ! -d "$HOME/.tmux" || ! -L "$HOME/.tmux.conf" ]]; then
		cd "$HOME"
		git clone https://github.com/gpakosz/.tmux.git
		ln -s -f .tmux/.tmux.conf
	else
		echo "oh-my-tmux already installed. 󰩑 "
	fi
    echo "oh-my-tmux installation complete."
}

echo "Do you want to install oh-my-tmux now? (y/n)"
read -r install_tmux
if [[ "$install_tmux" =~ ^[Yy]$ ]]; then
    install_oh_my_tmux
fi

# Installing Kitty
install_kitty() {
	echo "Installing kitty Terminal emulator..."
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
	ln -s ~/.local/kitty.app/bin/kitty /usr/local/bin/
	ln -s ~/.dotfiles/kitty/dracula.conf ~/.config/kitty/dracula.conf
	ln -s ~/.dotfiles/kitty/diff.conf ~/.config/kitty/diff.conf
	echo "kitty installation complete 😻"
}

if [[ "$EXPRESS_INSTALL" == false ]]; then
	echo "Do you want to install kitty now? (y/n)"
	read -r install_kitty
	if [[ "$install_kitty" =~ ^[Yy]$ ]]; then
		if [[ ! -d "$HOME/.local/kitty.app" ]]; then
			install_kitty
		else
			echo "kitty is already installed 😻"
		fi
	fi
else
	install_kitty
fi

# Create symlinks to .dotfiles
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
    echo "Created symlink from $SRC to $DEST" 🖒
}

if [[ "$EXPRESS_INSTALL" == false ]]; then
	echo "Do you want to create symlinks to .dotfiles now? (y/n)"
	read -r create_symlinks
	if [[ "$create_symlinks" =~ ^[Yy]$ ]]; then
		for SRC in "${!FILES[@]}"; do
			DEST=${FILES[$SRC]}
			create_symlink "$SRC" "$DEST"
		done
	fi
else
	for SRC in "${!FILES[@]}"; do
		DEST=${FILES[$SRC]}
		create_symlink "$SRC" "$DEST"
	done
fi

echo "${USER} Dev Environment Setup complete."
