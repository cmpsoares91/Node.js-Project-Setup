#!/bin/bash

# Simple setup.sh for ISMAT School Project

if [ $1 == server ] then
# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# All extra stuff for server add here

    echo "Server Setup Ready"
fi
if [ $1 == dev ] then
    echo "Developer Setup Ready"
else
    echo "No Specific selectio made."
fi
