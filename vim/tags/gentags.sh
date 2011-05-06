#!/bin/bash 

# STL sources could be downloaded from http://gsyc.es/~anavarro/src.tar.bz2 
STL=~/src/cpp
OGL=/usr/include/GL
SDL=/usr/include/SDL
QT4=/usr/include/qt4

cmd=`which ctags`

if [ -z $cmd ]; then
    echo "Error: Exuberant ctags must be installed before continue"
    exit 1
fi 

for i in $STL $OGL $SDL $QT4; 
do 
    if [ ! -d $i ]; then
        echo "No sources found in $i. Skipping..."
    else
        echo "Generating tags for $i..."
        ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f `basename $i` $i
    fi 
done 

