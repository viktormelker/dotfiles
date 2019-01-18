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
