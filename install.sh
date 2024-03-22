#!/bin/sh

mkdir -p ~/.vim_swap
cd ~/.vim_runtime

cat << '__vimrc__' > ~/.vimrc
set runtimepath+=~/.vim_runtime,~/.vim_runtime/after
source ~/.vim_runtime/main.vim
__vimrc__

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Disable "Use macOS line spacing calculation" option which looks bad with Fira Code font
    defaults write org.vim.MacVim MMFontPreserveLineSpacing 0
fi

echo "Installed"
