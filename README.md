# Installation
Run the following commands in order:  

    cd ~
    git clone https://github.com/Acaki/dotfiles.git
    cd dotfiles
    chmod +x bootstrap.sh
    ./bootstrap.sh
    # You can choose to install/not install individual files when prompted
    
If any files you choose to install has already exists in your home directory, it will be moved to `~/dotfiles_old` which enables you to restore your original files after installation.

# How to update to latest version

1. `cd` to dotfiles folder
2. Run `git pull --rebase` (or run `bootstrap.sh` if you want to choose different files to install)
3. Open vim, and run `:PlugClean` followed by `:PlugUpdate` (If there are changes to plugins)  

# Included vim plugins
* [vim-plug](https://github.com/junegunn/vim-plug) for plugin managements, it will be automatically installed when you launch vim for the first time after installing vimrc in this repository.
* [solarized](https://github.com/altercation/vim-colors-solarized) (default colorscheme)  
**Note: You need to set up your terminal properly for solarized to display correct colors, please refer to their repository for details.**
* [lightline](https://github.com/itchyny/lightline.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [surround](https://github.com/tpope/vim-surround)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [commentary](https://github.com/tpope/vim-commentary)
* [fugitive](https://github.com/tpope/vim-fugitive)

# Key mappings
## vim

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
## tmux
Prefix key is changed to `Ctrl + A`

Press Alt + 1, 2, ..., 9 to switch windows

    bind-key -n M-1 select-window -t 1
    bind-key -n M-2 select-window -t 2
    bind-key -n M-3 select-window -t 3
    bind-key -n M-4 select-window -t 4
    bind-key -n M-5 select-window -t 5
    bind-key -n M-6 select-window -t 6
    bind-key -n M-7 select-window -t 7
    bind-key -n M-8 select-window -t 8
    bind-key -n M-9 select-window -t 9



# How to include your own vim config
Create a file named `my_configs.vim` in `~/dotfiles/my_configs.vim`, then simply edit the file to add vim configs as you like.  

    " Example for using default vim theme
    color default " Use default vim theme
    let g:lightline['colorscheme'] = 'default' "Use default lightline theme
    
If you want to install additional vim plugins, create a file named `my_plugins.vim` in the same folder and use `Plug` commands to add plugins.  

    " Example for installing vim-syntastic plugin
    Plug 'vim-syntastic/syntastic'

For more supported plugin path syntax please refer to [vim-plug](https://github.com/junegunn/vim-plug).
