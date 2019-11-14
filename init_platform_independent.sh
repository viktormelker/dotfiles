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
# pyenv install 2.7.16
# pyenv install 3.7.5
# pyenv install 3.8.0


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
git clone https://github.com/zplug/zplug $ZPLUG_HOME

# jenv
git clone https://github.com/gcuisinier/jenv.git ~/.jenv

# vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# Install all plugins with :PluginInstall in vim
# Configure YouCompleteMe by running install
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
