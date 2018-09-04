#!/bin/bash

echo "Changing directory to home..."
cd $HOME
mkdir -p src
cd src

TMUX_VERSION=2.7
FISH_VERSION=2.7.1
PREFIX=$HOME/.local

echo "Installing vim..."
# Install vim
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-multibyte --enable-pythoninterp --prefix=${PREFIX}
make && make install
cd ..

echo "Installing tmux..."

# Install libevent
wget https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
tar zxvf libevent-2.1.8-stable.tar.gz
cd libevent-2.1.8-stable
./configure --prefix=${PREFIX} --disable-shared
make && make install
cd ..

# Install tmux
wget https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz
tar zxvf tmux-${TMUX_VERSION}.tar.gz
cd tmux-${TMUX_VERSION}
./configure --prefix=${PREFIX} CFLAGS="-I${PREFIX}/include" LDFLAGS="-L${PREFIX}/lib -L${PREFIX}/include" CPPFLAGS="-I${PREFIX}/include" LDFLAGS="-L${PREFIX}/include -L${PREFIX}/lib"
make && make install
cd ..

# Install fish
wget https://github.com/fish-shell/fish-shell/releases/download/${FISH_VERSION}/fish-${FISH_VERSION}.tar.gz
tar zxvf fish-${FISH_VERSION}.tar.gz
cd fish-${FISH_VERSION}
./configure --prefix=${PREFIX}
make && make install

# Check if the user is using bash
if [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
  # Change login shell, since we don't have password and root access
  echo "if [ -f ${PREFIX}/bin/fish ]; then
  export SHELL=${PREFIX}/bin/fish
  exec ${PREFIX}/bin/fish -l
fi" >> $HOME/.bash_profile
fi

echo "Cleaning up..."
rm -rf $HOME/src
echo "All done."
