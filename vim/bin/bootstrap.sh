#!/bin/bash
# 
# VIM Bundles bootstrapper
#
# Alvaro Navarro <alnacle@gmail.com>

runcmd() {
   "$@"

   if [ $? != 0 ]; then
      printf "Error when executing command: '$1'"
      exit $ERROR_CODE
   fi
}

if [ ! -d bundle ]; then
    runcmd mkdir bundle
fi

echo "Cloning vundle..."
runcmd git clone https://github.com/gmarik/vundle.git bundle/vundle

echo "Installing Bundles..."
runcmd vim +BundleInstall +qall

