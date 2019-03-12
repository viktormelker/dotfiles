# install all cross plattform stuff here

git config --global user.email "viktormelker@gmail.com"
git config --global user.name "Viktor Melker"
git config --global gpg.program gpg2

pip install --upgrade pip
sudo pip install virtualenv
sudo pip install pep8
sudo pip install setuptools
sudo pip install flake8
sudo pip install yapf
sudo pip install pylint

mkdir ~/dev

# install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install pyenv
curl https://pyenv.run | bash

# fzf, needed for some of the tmux stuff!
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# Nix package manager
curl https://nixos.org/nix/install | sh
. /home/viktor/.nix-profile/etc/profile.d/nix.sh
nix-env -i diff-so-fancy
nix-env -i ripgrep

# zsh
mkdir ~/.zsh

# zplug
export ZPLUG_HOME=~/.zplug
$ git clone https://github.com/zplug/zplug $ZPLUG_HOME

# jenv
git clone https://github.com/gcuisinier/jenv.git ~/.jenv

