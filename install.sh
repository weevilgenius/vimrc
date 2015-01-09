#!/bin/sh

mkdir -p ~/.vim_swap
cd ~/.vim_runtime

cat << '__vimrc__' > ~/.vimrc
set runtimepath+=~/.vim_runtime
source ~/.vim_runtime/main.vim
__vimrc__

echo "Installed"
