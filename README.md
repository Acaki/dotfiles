# Installation
Run the following commands in order:  

    cd ~
    git clone https://github.com/Acaki/dotfiles.git
    sh dotfiles/bootstrap.sh
    # You can choose to install/not install individual files when prompted
    
If any files you choose to install has already exists in your home directory, it will be moved to `~/dotfiles_old` which enables you to restore your original files after installation.

# How to update to latest version
You can do one of the follows to get newest changes:
* Simply run `bootstrap.sh` again
* Run `git pull` in `dotfiles` folder

For vim plugin updates, please open vim and run `:PlugClean` followed by `:PlugUpdate`.

# Included vim plugins
* [vim-plug](https://github.com/junegunn/vim-plug) for plugin managements, it will be automatically installed when you launch vim for the first time after installing vimrc in this repository.
* [solarized](https://github.com/altercation/vim-colors-solarized) (default colorscheme)  
**Note: You need to set up your terminal properly for solarized to display correct colors, please refer to their repository for details.**
* [airline](https://github.com/vim-airline/vim-airline) (default using `base16` colorscheme)  
**Note: You need to use patched font in your terminal to display some special characters, which can be found [here](https://github.com/powerline/fonts).**
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [surround](https://github.com/tpope/vim-surround)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [commentary](https://github.com/tpope/vim-commentary)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [auto-pairs](https://github.com/jiangmiao/auto-pairs)

# Key mappings
## vim

    let mapleader = ","
    
    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    
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


# How to include your own vim config
Create a file named `my_configs.vim` in `~/dotfiles/my_configs.vim`, then simply edit the file to add vim configs as you like.  

    " Example for using default vim theme
    colorscheme default " Use default vim theme
    let g:airline_theme = 'dark' " Use default theme for airline
    
If you want to install additional vim plugins, create a file named `my_plugins.vim` in the same folder and use `Plug` commands to add plugins.  

    " Example for installing vim-syntastic plugin
    Plug 'vim-syntastic/syntastic'

For more supported plugin path syntax please refer to [vim-plug](https://github.com/junegunn/vim-plug).
