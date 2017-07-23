#!/bin/bash

dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
olddir=~/dotfiles_old
files=".bashrc .gitconfig git-completion.bash .screenrc .vim_runtime"

git pull origin master
git submodule update --init --recursive
python $dir/.vim_runtime/my_plugins/YouCompleteMe/install.py
sh $dir/.vim_runtime/install_awesome_vimrc.sh 

printf "Creating backup directory..."
mkdir -p $olddir 
printf "done\n"

for file in $files; do
  echo "Moving $file from ~ to $olddir"
  mv ~/$file $olddir/
  echo "Symlinking $file"
  ln -s $dir/$file ~/$file
done
