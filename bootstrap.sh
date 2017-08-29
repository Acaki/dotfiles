#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

olddir=$HOME/dotfiles_old
files=".vimrc .gitconfig .screenrc .tmux.conf"

echo "Fetching newest version of this repository..."
git pull origin master

if [ ! -d $olddir ]; then
	printf "Creating backup directory..."
	mkdir $olddir
	printf "ok\n"
fi

for file in $files; do
  read -p "Do you wish to install $file? [y/n] " yn
  if [[ $yn =~ ^[Yy]$ ]]; then
    if [ -f $HOME/$file ] && [ ! -L $HOME/$file ]; then
      printf "Moving $HOME/$file to $olddir..."
      mv -n $HOME/$file $olddir/$file
      printf "ok\n"
    fi
    if [ ! -h $HOME/$file ]; then
      echo "Symlink $file to home directory..."
      ln -s $PWD/$file $HOME/$file
      if [ $file == ".gitconfig" ]; then
        read -p "Enter your name to be used in git: " name
        git config --global user.name "$name"
        read -p "Enter your email to be used in git: " email
        git config --global user.email "$email"
      fi
    fi
  fi
done

echo "Installation complete."
