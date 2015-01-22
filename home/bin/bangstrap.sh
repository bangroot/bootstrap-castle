#!/usr/bin/env bash


if [ -d $HOME/.homesick/repos/homeshick ]; then
	echo -n "Updating homeshick"
	cd $HOME/.homesick/repos/homeshick
	git pull $HOME/.homesick/repos/homeshick
	cd ~
else
	echo -n "Cloning homeshick"
	git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
if [ ! -e $HOME/bin ]; then
	echo -n "Creating a local bin directory"
	mkdir $HOME/bin
fi

export PATH=$PATH:~/bin
curl -o ~/bin/mr https://raw.github.com/bangroot/bootstrap-castle/master/home/bin/mr
chmod 755 ~/bin/mr
curl -o ~/.mrconfig https://raw.github.com/bangroot/bootstrap-castle/master/home/.mrconfig
 mr checkout

