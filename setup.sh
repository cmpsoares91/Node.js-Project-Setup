#!/bin/bash

# Simple setup.sh for ISMAT School Project
cd
apt-get install -y curl

install=1

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
 
else
    echo "No selection made."
    install=0
fi

if [ install == 1 ] ; then 
    echo "Install MEAN JavaScript Stack as well? (y/n)"
    a=1
    while [ $a -e 1 ]
    do
        a=0
        read meanOption
        if [ $meanOption == y ] ; then
            echo "Starting MEAN JavaScript Stack Instalation..."

            #Add MEAN.io installation commands...
    
            #Installing MongoDB:
            sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
            echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
            sudo apt-get update
            sudo apt-get install mongodb-org

            #Installing Bower:
            npm install bower

            #Installing MEAN.io:
            sudo npm install -g meanio@latest
        
            #Start App Right away?
            echo "--> Want to initiate mean App now? (y/n)"
            c=1
            while [ $c -e 1 ]
            do
                c=0
	            read appOption
                if [ $appOption == y ] ; then
                    read myApp
                    mean init $myApp
                    cd $myApp && npm install
                    grunt
                elif [ $appOption == n ] ; then
                    #Nothing Happens...
                    echo "--> Not initiation App..."
                else
                    echo "--> Please enter y or n:"
                    c=1
                fi
            done
        elif [ $meanOption == n ] ; then
            #Nothing Happens...
            echo "Not installing mean..."
        else
            echo "Please enter y or n:"
            a=1
        fi
    done
fi
