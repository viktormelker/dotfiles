# If you come from bash you might have to change your $PATH.
# export PATH="$HOME/bin:$HOME/.nix-profile/bin:/usr/local/bin;$PATH";

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="robbyrussell"

export FZF_BASE=~/.fzf

setopt hist_ignore_dups

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker-compose
  common-aliases
  # command-not-found
  docker
  kubectl
  tmux
  pip
  github
  fzf
  dotenv
  colored-man-pages
  httpie
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# required for vim plugin YouCompleteMe
export PYTHON_CONFIGURE_OPTS="--enable-shared"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH=~/.fzf/bin:$PATH

source ~/.zplug/init.zsh
zplug "MichaelAquilina/zsh-autoswitch-virtualenv"
export AUTOSWITCH_VIRTUAL_ENV_DIR=~/.local/share/virtualenvs  # to be the same as pipenv

# Can manage local plugins
zplug "~/.zsh", from:local

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

# Node stuff
export PATH="$HOME/.yarn/bin:$PATH"
source /usr/share/nvm/init-nvm.sh

# Python
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYTHONBREAKPOINT=ipdb.set_trace
export PYTHONIOENCODING=utf-8

# Aliases
source ~/.aliases
# For funnel work
source ~/.aliases_funnel
alias -s {cs,ts,html,py,js,jsx,json,sh,md,txt}=code

# add ruby paths
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# plugin
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Add custom functions
export FPATH="$HOME/.zsh/functions:$FPATH"
autoload -Uz kp
autoload -Uz fp
autoload -Uz paci
autoload -Uz yauth

# For rust executables
export PATH="$HOME/.cargo/bin:$PATH"

# direnv plugin for loading environment variables
eval "$(direnv hook zsh)"

# export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export GDK_SCALE=2
# export GDK_DPI_SCALE=0.5

export TERMINAL=/usr/bin/alacritty

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# requires password
# eval `keychain --agents ssh --eval id_ed25519_hm`

# completion for gcloud
source /opt/google-cloud-sdk/completion.zsh.inc
