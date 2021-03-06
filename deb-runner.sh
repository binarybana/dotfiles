#!/bin/bash -ex
# inspired from https://gist.github.com/2913223

# Prerequisites to run this script:
# SSH key that Github understands so we can checkout our dotfiles repo

# The power of automation!

# acquire git and curl
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install git curl dselect

# Install Homeshick
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
printf '\nsource $HOME/.homesick/repos/homeshick/homeshick.sh\n' >> $HOME/.bashrc
source $HOME/.bashrc

homeshick clone git@github.com:binarybana/dotfiles.git
# Answer n when it asks to symlink

mv $HOME/.ssh $HOME/ssh
homeshick symlink dotfiles
cp -a ssh/* $HOME/.homesick/repos/dotfiles/home/.ssh
rm -rf $HOME/ssh

# It appears there may be a bug in dpkg and there is a workaround that we're using here:
# http://rayslinux.blogspot.com/2012/10/ubuntu-1210-dpkg-warning-package-not-in.html
sudo dselect update
sudo dpkg --set-selections <$HOME/.homesick/repos/dotfiles/pkg-list.apt
sudo apt-get -u dselect-upgrade

chsh --shell /bin/zsh

# Get a local copy of GSP/ and Dropbox/ if available
# Install btsync

#echo "openout_any = a" >> /etc/texmf/web2c/texmf.cnf
