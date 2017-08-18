"""""""""""""""""""""""""""""""""""""""""""""""""
" Auto installation of vim-plug
"
"""""""""""""""""""""""""""""""""""""""""""""""""
if has("win32")
  if empty(glob('~\vimfiles\autoload\plug.vim'))
    set shell=C:\WINDOWS\sysnative\WindowsPowerShell\v1.0\powershell.exe
    silent !md ~\vimfiles\autoload;
          \ $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim';
          \ (New-Object Net.WebClient).DownloadFile($uri,$ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath('~\vimfiles\autoload\plug.vim'))
    set shell=cmd.exe
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'

try
  source ~/dotfiles/my_plugins.vim
catch
endtry

call plug#end()

let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for specific plugins 
"
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'base16'
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_extensions = ['quickfix', 'branch', 'ctrlp', 'tabline']
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#buffer_idx_mode = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_close_button = 0

nmap <leader>n :NERDTreeToggle<cr>
" Open NERDTree panel on the right side
let g:NERDTreeWinPos = "right"

nmap <leader>f :CtrlP<cr>
nmap <leader>j :CtrlPMRU<cr>
nmap <leader>b :CtrlPBuffer<cr>
" Fix for slow exiting
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


"""""""""""""""""""""""""""""""""""""""""""""""""
" General configs
"
"""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf8
if has('gui_running')
  " Avoid garbled characters in Chinese language windows OS
  let $LANG='en'
  set langmenu=en
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
else
  set t_Co=256
endif

set background=dark
colorscheme solarized

set autoread
" Always show status bar
set laststatus=2
" Reduce delay when exiting insert mode
set ttimeoutlen=50
" Improve macro performance
set lazyredraw
set noshowmode
set hidden
set wildmenu


"""""""""""""""""""""""""""""""""""""""""""""""""
" Text edit related
" 
"""""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=2
set tabstop=2
" Use spaces instead of tabs
set expandtab
" Be smart when using tabs ;)
set smarttab

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set clipboard=exclude:.*

set splitright
set splitbelow

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases 
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch 

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Configure backspace so it acts as it should act
set backspace=eol,start,indent


"""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"
"""""""""""""""""""""""""""""""""""""""""""""""""
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Turn persistent undo on 
" means that you can undo even when you close a buffer/VIM
silent !mkdir -p ~/.vim/undodir
set undodir=~/.vim/undodir
set undofile

try
  source ~/dotfiles/my_configs.vim
catch
endtry
