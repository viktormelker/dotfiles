
# basics
sudo apt install python-pip
sudo apt install python3-pip
pip install --upgrade pip


# setup base system
sudo apt update
sudo apt upgrade

sudo apt install docker.io
sudo apt install httpie
sudo apt install python-dev
sudo apt install python3-dev
sudo apt install nvim
sudo apt install python3-venv
sudo apt install npm
sudo apt install jq
sudo apt install tree
sudo apt install openssh-server
sudo apt install fonts-powerline
pip3 install --user pipenv
sudo apt install tmux

# neo4j
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
sudo apt-get update
sudo apt-get install neo4j

# Cloud development
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-cloud-sdk


sudo apt install google-cloud-sdk

# fyndiq new platform stuff
sudo apt install librdkafka-dev

# Install telepresence
cd ~/dev
git clone git@github.com:datawire/telepresence.git
sudo env PREFIX=/usr/local ~/dev/telepresence/install.sh


# VSCode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code # or code-insiders


# Zsh
apt-get install zsh
apt-get install git-core
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`

# pyenv
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev

# Cuda
sudo apt-get install libcublas9.1