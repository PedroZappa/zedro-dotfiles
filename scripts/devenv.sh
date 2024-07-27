#!/usr/bin/env bash
set -euo pipefail

# Check bash version for associative array support
if [ "${BASH_VERSINFO:-0}" -lt 4 ]; then
    echo "Error: This script requires bash version 4.0 or higher." >&2
    exit 1
fi

# Define the source and target FILES
declare -A FILES
FILES=(
    ["$HOME/.dotfiles/.zshrc"]="$HOME/.zshrc"
    ["$HOME/.dotfiles/.zshenv"]="$HOME/.zshenv"
    ["$HOME/.dotfiles/.vimrc"]="$HOME/.vimrc"
    ["$HOME/.dotfiles/nvim"]="$HOME/.config/nvim"
)

create_symlink() {
    local src=$1
    local dest=$2

    # Check if the destination file/directory exists
    if [ -e "$dest" ]; then
        # If it exists, move it to a backup
        mv "$dest" "${dest}_bak"
        echo "Moved existing $dest to ${dest}_bak"
    fi

    # Create the parent directory if it doesn't exist
    mkdir -p "$(dirname "$dest")"

    # Create the symlink
    ln -s "$src" "$dest"
    echo "Created symlink from $src to $dest"
}

# Iterate over FILES and create symlinks
for src in "${!FILES[@]}"; do
    dest=${FILES[$src]}
    create_symlink "$src" "$dest"
done
