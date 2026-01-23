# Setup fzf
# ---------
if [[ ! "$PATH" == */home/viktor/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/viktor/.fzf/bin"
fi

source <(fzf --zsh)
