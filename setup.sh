#!/bin/bash

function baseInstall() {
	# Simple setup.sh for ISMAT School Project
	cd
	apt-get install -y curl
	
	echo "Installing project structure:"

	# Installing dependencies:
	sudo apt-get update
	sudo apt-get install -y git
	sudo apt-get install -y gcc g++ autoconf automake libtool
	sudo apt-get install -y python-software-properties python make
	sudo apt-get install -y build-essential libssl-dev

	# Install jshint to allow checking of JS code within emacs
	# http://jshint.com/
	npm install -g jshint

	# Install rlwrap to provide libreadline features with node
	# See: http://nodejs.org/api/repl.html#repl_repl
	sudo apt-get install -y rlwrap

	# Install emacs24
	# https://launchpad.net/~cassou/+archive/emacs
	sudo add-apt-repository -y ppa:cassou/emacs
	sudo apt-get -qq update
	sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

	# Install nvm: node-version manager
	# https://github.com/creationix/nvm
	curl https://raw.github.com/creationix/nvm/master/install.sh | sh

	# Load nvm and install latest production node
	source $HOME/.nvm/nvm.sh
	nvm install v0.10
	nvm use v0.10

	# git pull and install dotfiles as well
	cd $HOME
	if [ -d ./dotfiles/ ]; then
		mv dotfiles dotfiles.old
	fi
	if [ -d .emacs.d/ ]; then
    		mv .emacs.d .emacs.d~
	fi
	git clone https://github.com/cmpsoares91/dotfiles.git
	ln -sb dotfiles/.screenrc .
	ln -sb dotfiles/.bash_profile .
	ln -sb dotfiles/.bashrc .
	ln -sb dotfiles/.bashrc_custom .
	ln -sf dotfiles/.emacs.d .
}

install=1

if [ $1 == server ] ; then
    echo "Starting Server Instalation..."

    # Instaling Base:
    baseInstall
    
    # Install Heroku toolbelt
    # https://toolbelt.heroku.com/debian
    wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

    # All extra stuff for server add here

    echo "Server Setup Ready"

elif [ $1 == dev ] ; then
    echo "Starting Developer Instalation..."

    # Instaling Base:
    baseInstall

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
            echo "Not installing MEAN..."
        else
            echo "Please enter y or n:"
            a=1
        fi
    done
fi
