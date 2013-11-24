#!/bin/sh
# 
# VIM Bundles bootstrapper
#
# Alvaro Navarro <anavarro@achtung.es>

set -e

curdir=`pwd`
vimdir=`dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )`

echo "Linking vim directory to $HOME/.vim"
if [ ! -L ~/.vim ]; then
    ln -s ${vimdir} ~/.vim
fi

echo "Linking vimrc file to $HOME/.vimrc"
if [ ! -L ~/.vimrc ]; then
    ln -s ${vimdir}/vimrc ~/.vimrc
fi 

cd ${vimdir}

if [ ! -d bundle ]; then
    mkdir bundle
fi

if [ -d bundle/vundle ]; then
    echo "Warning: vundle directory already exists. Cleaning..."
    rm -rf bundle/vundle
fi

echo "Cloning vundle..."
git clone https://github.com/gmarik/vundle.git bundle/vundle

echo "Installing Bundles..."
vim +BundleInstall +qall

cd ${curdir}
