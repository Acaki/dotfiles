# Installation
Run the following commands in order:  

    cd ~
    git clone https://github.com/Acaki/dotfiles.git
    cd dotfiles
    ./bootstrap.sh
    
If you choose to backup existing dotfiles, they will be moved to dotfiles_old located in your home directory.
Fish shell config file stored in .config/fish/config.fish

# How to update to latest version
Run the following commands in order:  

    cd ~/dotfiles
    ./update.sh

# Included vim plugins
* [vim-plug](https://github.com/junegunn/vim-plug) for plugin managements, it will be automatically installed when you launch vim for the first time.
* [lightline.vim](https://github.com/itchyny/lightline.vim) for lean and customizable status line
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-repeat](https://github.com/tpope/vim-repeat) make . more powerful
* [vim-commentary](https://github.com/tpope/vim-commentary) makes comment out things extremely fast
* [vim-fugitive](https://github.com/tpope/vim-fugitive) git integration for vim
* [vim-unimpaired](https://github.com/tpope/vim-unimpaired) some very useful key mappings
* [vim-abolish](https://github.com/tpope/vim-abolish) for fast changing of word style
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) showing line changes in git project files
* [vim-polyglot](https://github.com/sheerun/vim-polyglot) enhances syntax highlighting for various language
* [fzf](https://github.com/junegunn/fzf) for fast file search
* [fzf.vim](https://github.com/junegunn/fzf.vim) fzf wrapper for vim

# Additional vim plugins
These are the plugins that I use personally, they depend on newer environment or other dependencies so I don't enable them by default. 
(available in example/ folder, you need to copy my_configs.vim and my_plugins.vim in that folder to ~/dotfiles, VIM 8 AND TRUE COLOR TERMINAL AND POWERLINE FONTS ARE REQUIRED TO RUN THESE PLUGINS COREECTLY)
* [onedark.vim](https://github.com/joshdick/onedark.vim) onedark colorscheme
* [ale](https://github.com/joshdick/onedark.vim) very good async linting engine
* [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) lots of auto completion
* [ultisnips](https://github.com/SirVer/ultisnips) snippet solution for vim
* [vim-snippets](https://github.com/honza/vim-snippets) collections of snippets
* [vim-gutentags](https://github.com/ludovicchabant/vim-gutentags) auto ctags generation during editing

For more plugin specific usages please refer to the corresponding repository links above.
# Key mappings
## Vim

    " <leader> is mapped to space bar
    let mapleader = " "
    
    " Mappings for fzf
    nmap <leader>f :Files<cr>
    nmap <leader>b :Buffers<cr>
    nmap <leader>h :History<cr>
    nmap <leader>t :Tags<cr>
    nmap <leader>c :History:<cr>

    " GitGutter
    nmap ghp <Plug>GitGutterPreviewHunk
    nmap ghs <Plug>GitGutterStageHunk
    nmap ghu <Plug>GitGutterUndoHunk

    nmap <leader>w :w<cr>
    nmap <leader>x :x<cr>
    nmap <leader>q :q<cr>
    nmap <leader>e :e<cr>

    " Disable highlight when <leader><cr> is pressed
    nmap <leader><cr> :noh<cr>

    " Smart way to move between windows
    nmap <C-j> <C-W>j
    nmap <C-k> <C-W>k
    nmap <C-h> <C-W>h
    nmap <C-l> <C-W>l

    " Toggle scroll binding
    nmap <leader>sb :windo set scb!<cr>

    " Toggle paste mode on and off
    nmap <leader>p :setlocal paste!<cr>

For more detailed settings please refer to comments in .vimrc file.  
  
## Tmux
Prefix key is changed to `Ctrl + a`

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

# How to include your own vim config
Create a file named `my_configs.vim` in `~/dotfiles/my_configs.vim`, then simply edit the file to add vim configs as you like.  
Sample files are located in example/ folder (requires vim8 and true color support terminal).  

    " Example for using solarized theme
    color solarized
    let g:lightline['colorscheme'] = 'solarized' " Use solarized lightline theme
    
If you want to install additional vim plugins, create a file named `my_plugins.vim` in the same folder and use `Plug` commands to add plugins.  

    " Example for installing vim-syntastic plugin and solarized theme
    Plug 'vim-syntastic/syntastic'
    Plug 'altercation/vim-colors-solarized'

For more supported plugin path syntax please refer to [vim-plug](https://github.com/junegunn/vim-plug).

# Credits
+ [The ultimate Vim configuration](https://github.com/amix/vimrc) some useful vim settings in this repo are copied from here :P  
+ And from here (https://github.com/statico/dotfiles/blob/master/.vim/vimrc)
+ Aaaannnd from here (https://github.com/mathiasbynens/dotfiles)
+ All colleagues who makes good suggestions :)
