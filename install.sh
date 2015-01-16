#!/bin/sh

mkdir -p ~/.vim_swap
cd ~/.vim_runtime

cat << '__vimrc__' > ~/.vimrc
set runtimepath+=~/.vim_runtime,~/.vim_runtime/after
source ~/.vim_runtime/main.vim
__vimrc__

echo "Installed"
