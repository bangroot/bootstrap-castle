#!/usr/bin/env bash


git clone https://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
export PATH=$PATH:~/bin
curl -o ~/bin/mr https://raw.githubusercontent.com/bangroot/bootstrap-castle/master/home/bin/mr
curl -o ~/.mrconfig https://raw.githubusercontent.com/bangroot/bootstrap-castle/master/home/.mrconfig
chmod 600 ~/.mrconfig
chmod 755 ~/bin/mr

