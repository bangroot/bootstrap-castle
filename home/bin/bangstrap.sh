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

echo -n "Setting up mr and checking out castles"
export PATH=$PATH:~/bin
if [ -e $HOME/bin/mr]; then
	rm -f $HOME/bin/mr
fi
curl -L -o ~/bin/mr https://raw.github.com/bangroot/bootstrap-castle/master/home/bin/mr
chmod 755 ~/bin/mr
if [ -e $HOME/.mrconfig]; then
	rm -f $HOME/.mrconfig
fi
curl -L -o ~/.mrconfig https://raw.github.com/bangroot/bootstrap-castle/master/home/.mrconfig
mr checkout
mr initsubs

echo -n "Initializing homeshick"
homeshick link --force
if [ -e $HOME/.vim]; then
	rm -rf $HOME/.vim
fi
ln -s ~/.homesick/repos/vim-castle/dotvim ~/.vim
~/.vim/bundle/youcompleteme/install.sh

. ~/.bash_profile
echo -n "Done!"
