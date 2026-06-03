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

mkdir -p ~/dev/misc/tmux_logs

git clone https://github.com/hastinbe/i3-volume.git ~/i3-volume

# install cloud-sql-proxy
curl "https://storage.googleapis.com/cloud-sql-connectors/cloud-sql-proxy/v2.22.0/cloud-sql-proxy.linux.amd64" -o cloud-sql-proxy
chmod +x cloud-sql-proxy
sudo mv cloud-sql-proxy /usr/local/bin/cloud-sql-proxy
