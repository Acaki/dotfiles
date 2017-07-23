# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

source ~/git-completion.bash
export TERM=xterm-256color
export PATH=$HOME/vim/build/bin:$PATH
export PATH=$HOME/tmux-2.5/build/bin:$PATH
