#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

stow --target ~/ base fzf git python scripts tmux nvim vscode zsh pgcli autorandr
