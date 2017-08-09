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

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'raimondi/delimitMate'
Plug 'tpope/vim-fugitive'

call plug#end()

let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for specific plugins 
"
"""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline#extensions#whitespace#enabled = 0 
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_skip_empty_sections = 1

nmap <leader>n :NERDTreeToggle<cr>
" Open NERDTree panel on the right side
let g:NERDTreeWinPos = "right"

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let delimitMate_expand_cr = 1

nmap <leader>f :CtrlPMRU<cr>
" Fix for slow exiting
let g:ctrlp_clear_cache_on_exit = 0

"""""""""""""""""""""""""""""""""""""""""""""""""
" General configs
"
"""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized
set autoread
" For gitgutter to update faster
set updatetime=250
set hidden


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

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set encoding=utf8

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
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry
