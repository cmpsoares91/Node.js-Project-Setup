#!/bin/bash

# Simple setup.sh for ISMAT School Project

echo "Installing project structure:"

# Installing dependencies:
sudo apt-get install -y git
sudo apt-get install -y gcc g++ autoconf automake libtool

echo "test 1"

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

echo "test 2"

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.21
nvm use v0.10.21

echo "test 3"
# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

echo "test 4"

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo add-apt-repository -y ppa:cassou/emacs
sudo apt-get -qq update
sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg
 
echo "test 5" 
 
# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
    echo "test 6"
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
    echo "test 7"
fi
git clone https://github.com/startup-class/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
echo "test 8"
