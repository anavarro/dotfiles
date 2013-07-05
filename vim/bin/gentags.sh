#!/bin/bash 
# 
# VIM Tag file Generator
#
# Alvaro Navarro <alnacle@gmail.com>


vimdir=`dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )`
vimcfg=${vimdir}/vimrc_local
tagdir=${vimdir}/tags

cflags=`which ctags`

if [ -z ${cflags} ]; then
    echo "Error: Exuberant ctags must be installed before continue"
    exit 1
fi 

if [ -f ${vimcfg} ]; then
    rm -f ${vimcfg}
fi 

echo "\"WARNING: This is an automatically generated file. Do not modify!" >> ${vimcfg}

for i in `cat ${tagdir}/*.list`;
do
    if [ ! -d $i ]; then
        echo "No sources found in $i. Skipping..."
    else
        echo "Generating tags for $i..."
        ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ${vimdir}/tags/`basename $i` $i
        echo "Adding references to vim..."
        echo "set path+=$i/**" >> ${vimcfg}
        echo "set tags+=${vimdir}/tags/`basename $i`" >> ${vimcfg}
    fi
done

