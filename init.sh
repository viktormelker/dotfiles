#!/bin/bash

# set git user and email
git config --global user.email "viktormelker@gmail.com"
git config --global user.name "Viktor Melker"
git config --global gpg.program gpg2

# solved a problem i had with commiting. See https://github.com/desktop/desktop/issues/1391
#git config commit.gpgsign false

# create dirs
mkdir -p $HOME/repos
mkdir -p $HOME/bin

cd $HOME

## verticalize
git clone https://github.com/lindenb/verticalize.git $HOME/repos/verticalize
cd $HOME/repos/verticalize
make
cd $HOME/bin
ln -s $HOME/repos/verticalize/verticalize
