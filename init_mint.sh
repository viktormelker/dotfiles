# Setup file for linux mint based distros

# setup base system
sudo apt update
sudo apt upgrade
sudo apt-get dist-upgrade

# handler proprietary drivers
echo "Go into driver manager, use any drivers necessary. Press any key when done!"
pause

# install tools
sudo apt install htop
sudo apt install lastpass-cli
# sudo apt install snapd
sudo apt-get install meld


# For development
echo "VScode must be installed from .deb package on their website. Press any key to continue"
pause
sudo curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo apt install docker.io
sudo apt install python-pip
sudo apt install python3-pip
sudo apt install httpie
sudo apt install python-dev
sudo apt install python3-dev
sudo apt install vim
sudo apt install python3-venv
sudo apt install npm
sudo apt install jq
sudo apt install tree
sudo apt-get install openssh-server
sudo pip install pipenv
sudo apt-get install fonts-powerline
sudo pip3 install thefuck

# neo4j
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
sudo apt-get update
sudo apt-get install neo4j

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


