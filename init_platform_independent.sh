#!/bin/bash
# install all cross plattform stuff here

pip install --upgrade pip
pip install pipx
pipx install black
pipx install rich-cli
pipx install terminal-copilot

mkdir ~/dev

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install pyenv
curl https://pyenv.run | bash
# pyenv install 2.7.16
# pyenv install 3.7.5
# pyenv install 3.8.0


# fzf, needed for some of the tmux stuff!
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME

# Install starship, shell prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

git clone https://github.com/hastinbe/i3-volume.git ~/i3-volume

# For development environment version management
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
