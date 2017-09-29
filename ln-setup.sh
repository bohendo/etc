#!/bin/bash

etc=`dirname "$(readlink -f "$0")"`

# link dot files
ln -sfT "$etc/bashrc" "$HOME/.bashrc"
ln -sfT "$etc/eslintrc.json"  "$HOME/.eslintrc.json"
ln -sfT "$etc/gitconfig"  "$HOME/.gitconfig"
ln -sfT "$etc/inputrc" "$HOME/.inputrc"
ln -sfT "$etc/profile" "$HOME/.profile"
ln -sfT "$etc/pylintrc"  "$HOME/.pylintrc"
ln -sfT "$etc/vimrc"  "$HOME/.vimrc"

# setup my dropbox->home shortcut links
ln -sfT "$HOME/Dropbox/Documents" "$HOME/d"
ln -sfT "$HOME/Dropbox/Documents/bin" "$HOME/b"
ln -sfT "$HOME/Dropbox/Documents/etc" "$HOME/e"
ln -sfT "$HOME/Dropbox/Documents/journal" "$HOME/j"
ln -sfT "$HOME/Dropbox/Documents/notes" "$HOME/n"
ln -sfT "$HOME/Dropbox/Documents/todo" "$HOME/t"
ln -sfT "$HOME/Dropbox/Shared" "$HOME/s"

