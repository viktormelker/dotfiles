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

# fish shell
#sudo pacman -S fish fisherman
#curl -L https://get.oh-my.fish | fish
# plugins
#fisher pipenv
#fisher fzf
#fisher edc/bass  # bash scripts
#omf install bobthefish

# installing non standard packages
sudo pacman -S yay

#
sudo pacman -S bash-completion

sudo pacman -S chromium

# For development
yay visual-studio-code-bin
sudo pacman -S docker-compose
sudo pacman -S docker
# add user to docker group
sudo gpasswd -a viktor docker
# start docker daemon on boot
sudo systemctl enable docker.service

yay -S neo4j-community
sudo pacman -S python-pipenv
sudo pacman -S nodejs-lts-erbium
sudo pacman -S npm
sudo pacman -S vim jq tree
sudo pacman -S powerline-fonts
sudo pacman -S httpie
sudo pacman -S tmux
sudo pacman -S ctags


# Cloud development
yay -S google-cloud-sdk
yay -S kubernetes
yay -S kubectl-bin

yay -S spotify

# communication
yay -S franz

# for some openai envs
sudo pacman -S swig

yay -S slack-desktop
yay -S dropbox

sudo pacman -S hub
sudo pacman -S xsel
sudo pacman -S kscreen

sudo yay -S discord
sudo pacman -S neofetch
yay -S postman

yay -S aws-cli-v2-bin
yay -S nerd-fonts-complete
sudo pacman -S lsd
sudo pacman -S xclip
sudo pacman -S hub
sudo pacman -S postgresql

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

# for power management stuff
sudo pacman -S ethtool  # use to disable wake on lan
# sudo pacman -S acpi_call  # Thinkpad battery calibration

yay -S nvm
sudo pacman -S graphviz
sudo pacman -S tig
sudo pacman -S rustup
rustup install stable
rustup default stable
cargo install du-dust

sudo pacman -S cmake
sudo pacman -S termtosvg
sudo pacman -S mariadb

yay -S direnv
sudo pacman -S okular
sudo pacman -S yarn

# i3 stuff
sudo pacman -S i3-vm i3status-manjaro dmenu-manjaro i3-wallpapers i3lock pcmanfm network-manager-applet feh rofi py3status xautolock conky xorg-xbacklight pulseaudio pavucontrol dunst perl-anyevent-i3

yay -S alttab-git

sudo pacman -S tldr
sudo pacman -S kio-gdrive

npm install -g aws-cdk

# for dig etc
sudo pacman -S bind

# needed for some zsh autocomplete
sudo pacman -S gopass

sudo pacman -S ranger
sudo pacman -S redis

# websockets
sudo npm install -g wscat

# bluetooth
sudo pacman -S bluez-utils pulseaudio-bluetooth blueman

yay -S aws-vault

# for creating gifs
sudo pacman -S peek

# poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python

sudo pacman -S termite
sudo pacman -S zip

echo 'xrdb -merge ~/.Xresources' >> ~/.xinitrc

# take screenshot app
sudo pacman -S flameshot

sudo pacman -S rclone

yay -S i3-gnome-pomodoro-git
