#abbrs
source ~/.config/fish/abbr.fish

# add local extras, if they exist
if test -f ~/.extra.fish
  source ~/.extra.fish
end

# check if ssh key is added, if not; add it.
if not ssh-add -l > /dev/null
  ssh-add ~/.ssh/id_rsa
end

# Define alias in shell
alias git "hub"

set -g theme_powerline_fonts no

status --is-interactive; and source (pyenv init -|psub)

