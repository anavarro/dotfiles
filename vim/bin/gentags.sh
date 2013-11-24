#!/bin/sh 
# 
# VIM Tag file Generator
#
# Alvaro Navarro <anavarro@achtung.es>


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

echo "\"WARNING: this file was auto-generated. Do not modify!" >> ${vimcfg}

for i in $@;
do
    if [ ! -d $i ]; then
        echo "No sources found in $i. Skipping..."
    else
        echo "Generating tags for $i..."

        tagfile=${tagdir}/`basename $i`

        if [ "$OS" = "linux" ] ; then
            ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ${tagfile} $i
        fi

        if [ "$OS" = "openbsd" ] ; then
            find $i -name \*.c -o -name \*.h | xargs ctags -w -f ${tagfile}
        fi

        echo "Adding references to vim..."
        echo "set path+=$i/**" >> ${vimcfg}
        echo "set tags+=${tagdir}/`basename $i`" >> ${vimcfg}
    fi
done

