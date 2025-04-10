#!/bin/bash
set -e

# Setup file for arch linux based distros

sudo pacman -s stow

# handle keys
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys

# Configure fastest mirrors
sudo pacman-mirrors --fasttrack 10 && sudo pacman -Syyu

# update all installed packages
sudo pacman -Syu

# zsh
sudo pacman -S manjaro-zsh-config powerline zsh-completions zsh-history-substring-search zsh-syntax-highlighting
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# installing non standard packages
sudo pacman -S yay

#
sudo pacman -S bash-completion

# sudo pacman -S chromium

# For development
yay visual-studio-code-bin
sudo pacman -S kakoune
sudo pacman -S docker-compose
sudo pacman -S docker
sudo pacman -S dive
# add user to docker group
sudo gpasswd -a viktor docker
# start docker daemon on boot
sudo systemctl enable docker.service

# important developer stuff
sudo pacman -S vim jq tree
sudo pacman -S powerline-fonts
sudo pacman -S httpie
sudo pacman -S tmux
sudo pacman -S ctags
sudo pacman -S npm openslide
# sudo pacman -S nvm
sudo pacman -S zip
sudo pacman -S alacritty
sudo pacman -S xsel
sudo pacman -S kscreen
yay -S direnv
sudo pacman -S cmake
sudo pacman -S bind
sudo pacman -S gopass
# sudo pacman -S keychain
# sudo pacman -S github-cli
sudo pacman -S diff-so-fancy
sudo pacman -S difftastic
sudo pacman -S ripgrep
sudo pacman -S entr
yay -S udisks2 udiskie --needed
sudo pacman -S base-devel --needed


# Cloud development
yay -S google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin

# AWS stuff
yay -S aws-cli-v2-bin
yay -S aws-vault
npm install -g aws-cdk

# communication
yay -S franz
yay -S slack-desktop
yay -S discord

# Nice tools
sudo pacman -S peek flameshot
# sudo pacman -S graphviz
sudo pacman -S tig
sudo pacman -S rustup
rustup install stable
rustup default stable
cargo install du-dust
sudo pacman -S okular
sudo pacman -S lsd
sudo pacman -S tldr
sudo pacman -S ranger
sudo pacman -S unzip
sudo pacman -S autorandr
sudo pacman -S gnome-keyring seahorse  # for ssh agent keyring helpers
# sudo pacman -S btop
# sudo pacman -S yq
# sudo pacman -S xclip
yay -S nerd-fonts-complete
yay -S spotify libcurl-compat libcurl-gnutls
yay -S handlr-bin
# yay -S joplin
sudo pacman -S fwupd
# yay -S mons
sudo pacman -S numlockx
sudo pacman -S colordiff


# bluetooth
sudo pacman -S bluez-utils blueman

# Yubikey stuff
sudo pacman -S yubikey-manager-qt
sudo pacman -S yubikey-manager
sudo pacman -S yubico-pam
sudo pacman -S libu2f-host
sudo pacman -S libfido2
yay -S yubioath-desktop
yay -S acsccid
sudo systemctl enable pcscd.service
sudo systemctl start pcscd.service


# i3 stuff
sudo pacman -S i3-vm i3status-manjaro dmenu-manjaro
sudo pacman -S i3-wallpapers i3lock pcmanfm network-manager-applet
sudo pacman -S feh rofi py3status xautolock conky xorg-xbacklight i3blocks
sudo pacman -S pavucontrol dunst perl-anyevent-i3 xss-lock
yay -S xidlehook
yay -S rofi-greenclip

# Optional development stuff
# Tools
sudo pacman -S rclone
mkdir ~/google_drive
mkdir ~/dropbox
sudo pacman -S lazygit

# for kubernetes
yay -S minikube kubectl k9s kubectx stern kubeval helm skaffold krew
kubectl krew install explore

# poetry
# curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
sudo pacman -S openssl-1.1  # Needed for TLS in python. For example pip

# For flutter
yay -S flutter vysor ninja
sudo pacman -S dart

# Android development
yay -S android-sdk android-sdk-platform-tools android-sdk-build-tools android-tools
yay -S android-platform android-sdk-cmdline-tools-latest android-studio

# Virtualization and hardware acceleration (used by android studio for hardware acceleration)
sudo pacman -S qemu-full libvirt bridge-utils

# for circuitpython
yay -S mu-editor bossa

# for javascript development
sudo pacman -S yarn

# for arm programmer
yay -S jlink
sudo pacman -S arm-none-eabi-gcc arm-none-eabi-newlib

# ruby
sudo pacman -s ruby

# elixir
sudo pacman -S elixir
sudo pacman -S inotify-tools

# Instead of docker
sudo pacman -S podman

# for some openai envs
sudo pacman -S swig

# Databases
yay -S neo4j-community
sudo pacman -S redis
sudo pacman -S postgresql

sudo pacman -S mariadb

sudo pacman -S terraform
yay -S terraform-docs-bin
sudo pacman -S kustomize

# Kafka
yay -S kafkacat-git


# sound
sudo pacman -S pipewire wireplumber helvum

# SQL UI
sudo pacman -S dbeaver jre17-openjdk-headless

yay -S mongodb-tools-bin

# Webpage generation
sudo pacman -S hugo

yay -S lyx

sudo pacman -S networkmanager-openvpn openvpn

# for sftp
sudo pacman -S gvfs
yay -S gigolo
