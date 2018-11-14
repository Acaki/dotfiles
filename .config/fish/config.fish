test -d $HOME/.local/bin; and set PATH $HOME/.local/bin $PATH
set LANG en_US.UTF-8
set LC_ALL en_US.UTF-8

# if test -z "$TMUX"; and begin test -n "$USE_TMUX"; or test -n "$SSH_CLIENT"; end
#   tmux a 2>/dev/null; or cd; and exec tmux
# end
