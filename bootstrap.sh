#!/bin/bash

# If you are using windows, run git bash as administrator
# and run "export MSYS=winsymlinks:nativestrict" before running this script

cd "$(dirname "${BASH_SOURCE}")";

olddir=$HOME/dotfiles_old
files=".vimrc .gitconfig .tmux.conf .config/fish .tmux/tmux.remote.conf"
mkdir -p $HOME/.config $HOME/.tmux

echo "Fetching newest version of this repository..."
git pull origin master

read -p "Do you want to backup existing dotfiles? [y/n] " backup
if [[ $backup =~ ^[Yy]$ ]] && [ ! -d $olddir ]; then
  printf "Creating backup directory..."
  mkdir $olddir
  printf "ok\n"
fi

for file in $files; do
  if [ -f $HOME/$file ] && [ ! -L $HOME/$file ] && [[ $backup =~ ^[Yy]$ ]]; then
    printf "Moving $HOME/$file to $olddir..."
    mv -n $HOME/$file $olddir/$file
    printf "ok\n"
  fi
  if [ $file == ".gitconfig" ] && [ ! -f $HOME/.gitconfig.user ]; then
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
  if [ -d $HOME/$file ]; then
    rm -r $HOME/$file
  fi
  echo "Symlink $file to home directory..."
  ln -snf $PWD/$file $HOME/$file
done

# Read command line arguments
OPTS=$(getopt -o abe -l additional,build,example -- "$@")
eval set -- "$OPTS"
EXAMPLE=false BUILD=false ADDITIONAL=false
while true; do
  case "$1" in
    -b|--build)
      BUILD=true
      shift
      ;;
    -e|--example)
      EXAMPLE=true
      shift
      ;;
    -a|--additional)
      ADDITIONAL=true
      shift
      ;;
    --)
      shift
      break
      ;;
  esac
done

# For itatic characters, additional terminfo is necessary
if $EXAMPLE; then
  echo "Symlink example files..."
  ln -sf $PWD/example/* $PWD
  tic -x $PWD/terminfo/xterm-256color-italic.terminfo
  tic -x $PWD/terminfo/tmux-256color.terminfo
fi

if $ADDITIONAL; then
  addi_files=".config/alacritty .inputrc .xprofile .makepkg.conf"
  cd additional
  for file in $addi_files; do
    if [ -d $HOME/$file ]; then
      rm -r $HOME/$file
    fi
    echo "Symlink $file to home directory..."
    ln -snf $PWD/$file $HOME/$file
  done
fi

if $BUILD; then
  ./build_env.sh
fi

echo "Installation complete."
