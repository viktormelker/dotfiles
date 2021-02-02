# Dotfiles

Based on the blog post [here](https://medium.com/@waterkip/managing-my-dotfiles-with-gnu-stow-262d2540a866)

Uses GNU stow to create symlinks from this folder to your home folder for selected packages.

## Installation

Just execute `./bootstrap.sh`.


## Testing

Can be done in docker containter.

Build docker image with: `docker build -t dotfiles .`
Run with `docker run -ti dotfiles zsh`
