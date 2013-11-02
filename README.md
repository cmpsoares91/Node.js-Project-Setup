Node.js-Project-Setup
=========
Download the setup file and run it on a new EC2 instance running Ubuntu 12.04.2 LTS (Server install)
or PC Linux distro (Individual Development installation, only tested on Linux Mint)to configure both
the machine and your individual development environment as follows:

```sh
sudo su
wget https://raw.github.com/cmpsoares91/Node.js-Project-Setup/master/setup.sh

# If you want to setup on a new EC2 instance running Ubuntu 12.04.2 LTS for final setup use:
bash ./setup.sh server

# Else if you want to do a normal development install use:
bash ./setup.sh dev

exit
```
Start a new terminal, the use the following commands:

```sh
sudo su

# To load nvm and install latest production node

source $HOME/.nvm/nvm.sh
nvm install v0.10.21
nvm use v0.10.21
```

See also http://github.com/startup-class/dotfiles for more details.





