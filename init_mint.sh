# Setup file for linux mint based distros

# setup base system
sudo apt update
sudo apt upgrade
sudo apt-get dist-upgrade

# handler proprietary drivers
echo "Go into driver manager, use any drivers necessary. Press any key when done!"
pause


# new shell
sudo apt install fish

# install tools
sudo apt install htop
sudo apt install lastpass-cli
# sudo apt install snapd

# For development
echo "VScode must be installed from .deb package on their website. Press any key to continue"
pause
sudo apt install docker-compose
sudo apt install python-pip
sudo apt install httpie


# Cloud development
sudo apt install google-cloud-sdk
# sudo snap install kubectl --classic

# fyndiq new platform stuff
sudo apt install librdkafka-dev

