#!/bin/sh
set -e

cd ~/.vim_runtime
cat ~/.vim_runtime/vimrcs/basic.vim > ~/.vimrc
mkdir -p ~/.vim/colors
cp ./colors/*.vim ~/.vim/colors/
echo "Installed the Basic Vim configuration successfully! Enjoy :-)desert"
