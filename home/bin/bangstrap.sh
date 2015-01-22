#!/usr/bin/env bash


if [ -d $HOME/.homesick/repos/homeshick ]; then
	git pull $HOME/.homesick/repos/homeshick
else
	git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
if [ ~ -e $HOME/bin ]; then
	mkdir $HOME/bin
fi

export PATH=$PATH:~/bin
curl -o ~/bin/mr https://raw.githubusercontent.com/bangroot/bootstrap-castle/master/home/bin/mr
chmod 755 ~/bin/mr
mr bootstrap https://raw.githubusercontent.com/bangroot/bootstrap-castle/master/home/.mrconfig

