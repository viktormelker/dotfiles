# Setup file for linux mint based distros

# setup base system
sudo apt update
sudo apt upgrade
sudo apt-get dist-upgrade

# handler proprietary drivers
echo "Go into driver manager, use any drivers necessary. Press any key when done!"
pause


# new shell
nix-env -i fish
sudo ln -s ~/.nix-profile/bin/fish /usr/bin/

# install tools
sudo apt install htop
sudo apt install lastpass-cli
# sudo apt install snapd
nix-env --install ripgrep

# package manager
curl https://nixos.org/nix/install | sh

# for nicer diffs
nix-env -i diff-so-fancy

# For development
echo "VScode must be installed from .deb package on their website. Press any key to continue"
pause
sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt install docker.io
sudo apt install python-pip
sudo apt install httpie
sudo apt install python-dev
sudo apt install python3-dev
sudo apt install vim
sudo apt install python3-venv
sudo apt install npm

# fix problem with docker
sudo pip uninstall docker-py
sudo pip install docker



# Cloud development
sudo apt install google-cloud-sdk

# fyndiq new platform stuff
sudo apt install librdkafka-dev

# Install telepresence
cd ~/dev
git clone git@github.com:datawire/telepresence.git
sudo env PREFIX=/usr/local ~/dev/telepresence/install.sh


