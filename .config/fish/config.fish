test -d $HOME/.local/bin; and set PATH $HOME/.local/bin $PATH
set LANG en_US.UTF-8
set LC_ALL en_US.UTF-8

if test -z "$TMUX"; and test -n "$USE_TMUX"
  tmux a 2>/dev/null; or cd; and exec tmux
end
