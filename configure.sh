#!/bin/sh 

echo "Linking bash configuration files..."
for i in bash/*; do ln -s $i $HOME/.`basename $i`; done
echo "Linking vim configuration files..."
ln -s vim $HOME/.vim 
ln -s vim/vimrc $HOME/.vimrc 

