#!/bin/bash

olddir=$HOME/dotfiles_old
files=".vimrc .bashrc .gitconfig git-completion.bash .screenrc .tmux.conf"

echo "Fetching newest version of this repository..."
git pull origin master

if [ ! -d $olddir ]; then
	printf "Creating backup directory..."
	mkdir $olddir
	printf "ok\n"
	for file in $files; do
		if [ -f $HOME/$file ]; then
			printf "Moving $HOME/$file to $olddir..."
			mv $HOME/$file $olddir/
			printf "ok\n"
		fi
	done
fi

for file in $files; do
	if [ ! -h $HOME/$file ]; then
		echo "Symlink $file to home directory..."
		ln -s $PWD/$file $HOME/$file
	fi
done

echo "Installation complete."
