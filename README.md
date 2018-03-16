# Installation
Run the following commands in order:  

    cd ~
    git clone https://github.com/Acaki/dotfiles.git
    cd dotfiles
    ./bootstrap.sh
    # You can choose to install/not install individual files when prompted
    # Please note that if you choose to install .gitconfig the script will ask you for entering name and email that will be used in git.
    
If any files you choose to install has already exists in your home directory, it will be moved to `~/dotfiles_old` which enables you to restore your original files after installation.

# How to update to latest version
Run the following commands in order:  

    cd ~/dotfiles
    ./update.sh

# Included vim plugins
* [vim-plug](https://github.com/junegunn/vim-plug) for plugin managements, it will be automatically installed when you launch vim for the first time.
* [vim-airline](https://github.com/vim-airline/vim-airline) for plugin managements, it will be automatically installed when you launch vim for the first time.
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-repeat](https://github.com/tpope/vim-repeat) make . more powerful
* [vim-commentary](https://github.com/tpope/vim-commentary) makes comment out things extremely fast
* [vim-fugitive](https://github.com/tpope/vim-fugitive) git integration for vim
* [syntastic](https://github.com/vim-syntastic/syntastic) syntax checker for multiple languages
* [vim-javascript](https://github.com/pangloss/vim-javascript) enhances javascript syntax highlighting
* [fzf](https://github.com/junegunn/fzf) for fast file search

For more plugin specific usages please refer to the corresponding repository links above.
# Key mappings
## Vim

    " <leader> is mapped to ","
    let mapleader = ","
    
    nmap <leader>n :NERDTreeToggle<cr>
    
    nmap <leader>f :CtrlP<cr>
    nmap <leader>j :CtrlPMRU<cr>
    nmap <leader>b :CtrlPBuffer<cr>

    " For fast saving, no more :W bullshit
    nmap <leader>w :w!<cr>
    
    " Mappings for switching buffers
    nnoremap ]b :bn<cr>
    nnoremap [b :bp<cr>
    nnoremap <leader>c :bp\|bd #<cr>

    " Disable highlight when <leader><cr> is pressed
    nmap <leader><cr> :noh<cr>

    " Smart way to move between windows
    nmap <C-j> <C-W>j
    nmap <C-k> <C-W>k
    nmap <C-h> <C-W>h
    nmap <C-l> <C-W>l

    " Toggle scroll binding
    nmap <leader>sb :windo set scb!<cr>

    " Opens a new tab with the current buffer's path
    " Super useful when editing files in the same directory
    nmap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
    nmap <leader>tc :tabclose<cr>
    nmap <leader>tm :tabmove

    " Remove the Windows ^M - when the encodings gets messed up
    noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

    " Toggle paste mode on and off
    nmap <leader>p :setlocal paste!<cr>

For more detailed settings please refer to comments in .vimrc file.  
  
## Tmux
Prefix key is changed to `Ctrl + A`

Press Alt + `, 1, 2, ..., 9 to switch windows

    bind-key -n M-` select-window -t 0
    bind-key -n M-1 select-window -t 1
    bind-key -n M-2 select-window -t 2
    bind-key -n M-3 select-window -t 3
    bind-key -n M-4 select-window -t 4
    bind-key -n M-5 select-window -t 5
    bind-key -n M-6 select-window -t 6
    bind-key -n M-7 select-window -t 7
    bind-key -n M-8 select-window -t 8
    bind-key -n M-9 select-window -t 9
    bind-key -n M-0 select-window -t 10
    
## Screen
Press Alt + `, 1, 2, ..., 9 to switch screens

    bindkey "^[`" select 0
    bindkey "^[1" select 1
    bindkey "^[2" select 2
    bindkey "^[3" select 3
    bindkey "^[4" select 4
    bindkey "^[5" select 5
    bindkey "^[6" select 6
    bindkey "^[7" select 7
    bindkey "^[8" select 8
    bindkey "^[9" select 9
    bindkey "^[0" select 10

# How to include your own vim config
Create a file named `my_configs.vim` in `~/dotfiles/my_configs.vim`, then simply edit the file to add vim configs as you like.  

    " Example for using solarized theme
    color solarized
    let g:lightline['colorscheme'] = 'solarized' " Use solarized lightline theme
    
If you want to install additional vim plugins, create a file named `my_plugins.vim` in the same folder and use `Plug` commands to add plugins.  

    " Example for installing vim-syntastic plugin and solarized theme
    Plug 'vim-syntastic/syntastic'
    Plug 'altercation/vim-colors-solarized'

For more supported plugin path syntax please refer to [vim-plug](https://github.com/junegunn/vim-plug).

# Credits
+ [The ultimate Vim configuration](https://github.com/amix/vimrc) lots of useful vim settings in this repo are copied from here :P  
+ All colleagues who makes good suggestions :)
