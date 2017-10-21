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

## linuxbrew
#ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"


# pyenv 
#git clone git://github.com/yyuu/pyenv.git ~/.pyenv

## cpanminus
#curl https://raw.githubusercontent.com/miyagawa/cpanminus/master/cpanm | perl - -l ~/perl5 App::cpanminus local::lib
#eval `perl -I ~/perl5/lib/perl5 -Mlocal::lib`

# python 2.7.8
#pyenv install 2.7.8
#pyenv global 2.7.8

# git-achievements
#git clone https://github.com/dakl/git-achievements.git $HOME/bin/gitachievements
#ln -s $HOME/bin/gitachievements/git-achievements $HOME/bin/git-achievements
