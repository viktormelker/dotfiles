#!/bin/bash
# install all cross plattform stuff here

pip install --upgrade pip

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

# vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install all plugins with :PluginInstall in vim
# Configure YouCompleteMe by running install
~/.vim/bundle/YouCompleteMe/install.py --clang-completer

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# zplug
export ZPLUG_HOME=~/.zplug
git clone https://github.com/zplug/zplug $ZPLUG_HOME

# Install starship, shell prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
