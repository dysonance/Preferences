#!/bin/bash

# entry
cd $HOME/Preferences

# packages
brew update
brew upgrade

# python
ipi list --outdated --format=freeze sed 's/=*[0-9.]//g' | xargs -n1 pip3 install --upgrade

# alacritty
./apps/alacritty/deploy.sh

# vim
./apps/vim/deploy.sh
vim -c ":PlugUpdate | :qa"
py $HOME/.vim/plugged/YouCompleteMe/install.py --all

# julia
./apps/julia/deploy.sh
julia --color=yes -e 'using Pkg; pkgs = String.(keys(Pkg.installed())); for pkg in pkgs; eval(Meta.parse("using $pkg")); end'
