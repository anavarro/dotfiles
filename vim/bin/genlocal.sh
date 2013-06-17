#!/bin/bash 
# 
# VIM Tag file Generator
#
# Alvaro Navarro <alnacle@gmail.com>


cflags=`which ctags`

vimcfg=../vimrc_local

if [ -z $cflags ]; then
    echo "Error: Exuberant ctags must be installed before continue"
    exit 1
fi 

if [ -f ${vimcfg} ]; then
    rm -f ${vimcfg}
fi 

for i in `cat *.list`;
do
    if [ ! -d $i ]; then
        echo "No sources found in $i. Skipping..."
    else
        echo "Generating tags for $i..."
        ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ../tags/`basename $i` $i
        echo "Adding references to vim..."
        echo "set path+=$i/**" >> ${vimcfg}
        echo "set tags+=`pwd`/../tags/`basename $i`" >> ${vimcfg}
    fi
done

