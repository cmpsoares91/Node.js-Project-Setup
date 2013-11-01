#!/bin/bash

# Simple setup.sh for ISMAT School Project

apt-get install -y curl

if [ $1 == server ] ; then
    echo "Starting Server Instalation"

    # Instaling Base:
    curl https://raw.github.com/cmpsoares91/Node.js-Project-Setup/master/setup-base.sh | sh

    # Install Heroku toolbelt
    # https://toolbelt.heroku.com/debian
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

    # All extra stuff for server add here

    echo "Server Setup Ready"

elif [ $1 == dev ] ; then
    echo "Starting Developer Instalation"

    # Instaling Base:
    curl https://raw.github.com/cmpsoares91/Node.js-Project-Setup/master/setup-base.sh | sh

    echo "Developer Setup Ready"
else
    echo "No selection made."
fi

