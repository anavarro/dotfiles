#!/bin/bash 

if [ -f ../vimrc_local ];
then
    rm -f ../vimrc_local
fi

for i in `cat *.list`;
do
    echo "set path+=$i/**" >> ../vimrc_local
    echo "set tags+=`pwd`/../tags/`basename $i`" >> ../vimrc_local
    ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ../tags/`basename $i` $i
done

