#!/bin/sh

runcmd() {
   "$@"

   if [ $? != 0 ]; then
      printf "Error when executing command: '$1'"
      exit $ERROR_CODE
   fi
}

if [ -d bundle ]; then
    echo "Cloning vundle..."
    runcmd git clone https://github.com/gmarik/vundle.git bundle/vundle
else
    echo "Ops! Unable to find bundle directory"
fi

runcmd vim +BundleInstall +qall

