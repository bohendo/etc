#!/bin/bash

# Link the vimrc from my personal etc folder
etc="$HOME/Dropbox/Documents/etc"
ln -sfT "$etc/vimrc"  "$HOME/.vimrc"

# This folder will store our temporary backup files
mkdir -p ~/.vimtmp

# folders to store plugins
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/bundle

# https://github.com/tpope/vim-pathogen
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd ~/.vim/bundle

git clone -q --depth=1 https://github.com/vim-syntastic/syntastic.git 2> /dev/null
git clone -q https://github.com/pangloss/vim-javascript.git 2> /dev/null
git clone -q https://github.com/mxw/vim-jsx.git 2> /dev/null
git clone https://github.com/scrooloose/nerdtree.git 2> /dev/null

echo "Vim successfully configured"

