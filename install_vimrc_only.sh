#!/bin/bash

echo "Fetching newest version of this repository..."
git pull origin master

if [ -f $HOME/.vimrc ] && ! [ -f $HOME/.vimrc.old ]; then
  printf "Rename old vimrc file..."
  mv $HOME/.vimrc $HOME/.vimrc.old
  printf "ok\n"
fi

echo "Symlink .vimrc to home directory..."
ln -s $PWD/.vimrc $HOME/.vimrc
echo "Installation complete."
