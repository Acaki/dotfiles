#!/bin/bash

echo "Fetching newest version of this repository..."
git pull origin master

echo "Updating vim plugins..."
vim +PlugClean! +PlugUpdate +qall

echo "Update complete."
