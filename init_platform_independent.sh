#!/bin/bash
# install all cross plattform stuff here

# install uv
curl -LsSf https://astral.sh/uv/install.sh | sh

mkdir ~/dev

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install pyenv
curl https://pyenv.run | bash

# fzf, needed for some of the tmux stuff!
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME

# Install starship, shell prompt
# sh -c "$(curl -fsSL https://starship.rs/install.sh)"
