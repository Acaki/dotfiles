# Installation
Run the following commands in order:  

    git clone https://github.com/Acaki/dotfiles.git
    sh dotfiles/bootstrap.sh
    # You can choose to install/not install individual files when prompted
    
If any files you choose to install has already exists in your home directory, it will be moved to `~/dotfiles_old` which enables you to restore your original files after installation.

# How to update to latest version
You can do one of the follows to get newest changes
* Simply run `bootstrap.sh` again
* Run `git pull` in dotfiles folader

For plugin updates, please open vim and run `:PlugClean` followed by `:PlugUpdate`

# Included plugins
* [vim-plug](https://github.com/junegunn/vim-plug) for plugin managements, it will be automatically installed when you launch vim for the first time after installing vimrc in this repository.
* [solarized](https://github.com/altercation/vim-colors-solarized) (default colorscheme)
* [lightline](https://github.com/itchyny/lightline.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [surround](https://github.com/tpope/vim-surround)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [commentary](https://github.com/tpope/vim-commentary)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [auto-pairs](https://github.com/jiangmiao/auto-pairs)

# Key mappings

    let mapleader = ","
    
    nmap <leader>n :NERDTreeToggle<cr>
    nmap <leader>f :CtrlP<cr>
    nmap <leader>j :CtrlPMRU<cr>

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

More settings please refer to comments in .vimrc file

# How to include your own config
Create a file named `my_configs.vim` in the same directory of this repository (e.g. `~/dotfiles/my_configs.vim` if you clone at home directory), then simply edit the file to add vim configs as you like.  
  
For example, if you want to change the colorscheme to default one, add the following lines in `my_configs.vim`:  

    colorscheme default "Use default vim theme
    let g:lightline['colorscheme'] = 'default' "Use default lightline theme
