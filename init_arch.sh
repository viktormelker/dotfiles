# Setup file for arch linux based distros

# handle keys
#sudo pacman-key --init
#sudo pacman-key --populate archlinux
#sudo pacman-key --refresh-keys

# update all installed packages
sudo pacman -Syu

# new shell
sudo pacman -S fish fisherman
curl -L https://get.oh-my.fish | fish
# plugins
fisher pipenv
fisher fzf
fisher edc/bass  # bash scripts
omf install bobthefish

# installing non standard packages
sudo pacman -S yaourt

#
sudo pacman -S bash-completion



# For development
yaourt visual-studio-code
sudo pacman -S docker-compose
sudo pacman -S ripgrep
sudo pacman -S yapf
yaourt -S neo4j-community
yaourt -S python-pipenv


# Cloud development
yaourt google-cloud-sdk
yaourt -S kubernetes

# fyndiq new platform stuff
yaourt -S librdkafka-git
