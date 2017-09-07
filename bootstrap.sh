#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

olddir=$HOME/dotfiles_old
files=".vimrc .gitconfig .screenrc .tmux.conf"

echo "Fetching newest version of this repository..."
git pull

read -p "Do you want to backup existing dotfiles? [y/n] " backup
if [[ $backup =~ ^[Yy]$ ]] && [ ! -d $olddir ]; then
  printf "Creating backup directory..."
  mkdir $olddir
  printf "ok\n"
fi

for file in $files; do
  read -p "Do you want to install $file? [y/n] " install 
  if [[ $install =~ ^[Yy]$ ]]; then
    if [ -f $HOME/$file ] && [ ! -L $HOME/$file ] && [[ $backup =~ ^[Yy]$ ]]; then
      printf "Moving $HOME/$file to $olddir..."
      mv -n $HOME/$file $olddir/$file
      printf "ok\n"
    fi
    if [ ! -h $HOME/$file ]; then
      echo "Symlink $file to home directory..."
      ln -sf $PWD/$file $HOME/$file
      if [ $file == ".gitconfig" ]; then
        while read -p "*** Enter your name to be used in git ***: " name
        do
          if [ -n "$name" ]; then
            printf "[user]\n\tname = %s" $name >> $HOME/.gitconfig.user
            break;
          fi
        done
        while read -p "*** Enter your email to be used in git ***: " email
        do
          if [ -n "$email" ]; then
            printf "\n\temail = %s" $email >> $HOME/.gitconfig.user
            break;
          fi
        done
      fi
    fi
  fi
done

echo "Installation complete."
