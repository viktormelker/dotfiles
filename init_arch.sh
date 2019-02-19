# Setup file for arch linux based distros

# handle keys
#sudo pacman-key --init
#sudo pacman-key --populate archlinux
#sudo pacman-key --refresh-keys

# update all installed packages
sudo pacman -Syu

# zsh
sudo pacman -S manjaro-zsh-config powerline zsh-autosuggestions zsh-completions zsh-history-substring-search zsh-syntax-highlighting
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
yay -S neo4j-community
sudo pacman -S python-pipenv
sudo pacman -S nodejs
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

# fyndiq new platform stuff
yay -S librdkafka-git

# communication
yay -S franz

# Configure fastest mirrors
sudo pacman-mirrors --fasttrack 10 && sudo pacman -Syyu

# install poetry
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
source $HOME/.poetry/env
mkdir ~/.zfunc
poetry completions zsh > ~/.zfunc/_poetry

# for some openai envs
sudo pacman -S swig

# tensorflow stuff
sudo pacman -S openmpi
# for opencl
sudo pacman -S clinfo ocl-icd opencl-headers
yay -S python-pygpu-git
# for AMD GPU
sudo pacman -S opencl-mesa
