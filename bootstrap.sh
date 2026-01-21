#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

stow --target ~/ base fzf git python scripts tmux nvim vscode zsh pgcli autorandr warp i3 ssh yubico starship
ln -s ~/dev/dotfiles/git/.gitignore ~/.gitignore

# Add Cursor settings, same as VSCode
ln -sf ~/dev/dotfiles/vscode/.config/Code/User/settings.json ~/.config/Cursor/User/settings.json
ln -sf ~/dev/dotfiles/vscode/.config/Code/User/keybindings.json ~/.config/Cursor/User/keybindings.json
