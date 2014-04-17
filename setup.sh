#!/bin/bash

# Simple setup.sh for ISMAT School Project
cd
apt-get install -y curl

if [ $1 == server ] ; then
    echo "Starting Server Instalation..."

    # Instaling Base:
    curl https://raw.github.com/cmpsoares91/Node.js-Project-Setup/master/setup-base.sh | sh

    # Install Heroku toolbelt
    # https://toolbelt.heroku.com/debian
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

    # All extra stuff for server add here

    echo "Server Setup Ready"

elif [ $1 == dev ] ; then
    echo "Starting Developer Instalation..."

    # Instaling Base:
    curl https://raw.github.com/cmpsoares91/Node.js-Project-Setup/master/setup-base.sh | sh

    echo "Developer Setup Ready"

elif [$2 == mean.io] ; then
    echo "Starting MEAN JavaScript Stack Instalation..."
    
    #Add MEAN.io installation commands...

else
    echo "No selection made."
fi

source $HOME/.nvm/nvm.sh
nvm install v0.10.26
nvm use v0.10.26

