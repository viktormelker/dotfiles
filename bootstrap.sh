#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

stow --target ~/ base fzf git i3 python scripts tmux vim vscode zsh starship
