# Installation
Run the following commands in order:  

    git clone https://github.com/Acaki/dotfiles.git
    cd dotfiles
    sh install_all.sh
    or
    sh install_vimrc_only.sh
    
Your existing dotfiles will be moved to dotfiles_old directory if you choose to install all, and your existing .vimrc file will be renamed to .vimrc.old if you choose to install vimrc only.

# Included plugins
* [Solarized](https://github.com/altercation/vim-colors-solarized)
* [lightline](https://github.com/itchyny/lightline.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [surround](https://github.com/tpope/vim-surround)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [commentary](https://github.com/tpope/vim-commentary)
* [fugitive](https://github.com/tpope/vim-fugitive)
* [auto-pairs](https://github.com/jiangmiao/auto-pairs)

# Key mappings
Leader key is mapped to ','

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
Create a file named my_configs.vim in the same directory of this repository (~/dotfiles/my_configs.vim if you clone at home directory)  
Then simply edit the file to add configs your like.
