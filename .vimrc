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

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-abolish'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

try
  source ~/dotfiles/my_plugins.vim
catch
endtry

call plug#end()

" <leader> is mapped to ","
nnoremap <space> <nop>
let mapleader = " "

"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for specific plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_x=''
if !exists('g:airline_symbols')
 let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
function! AirlineInit()
  let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])
endfunction
autocmd User AirlineAfterInit call AirlineInit()

" Mappings for switching tabs/buffers in airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Mappings for fzf
nmap <leader>f :Files<cr>
nmap <leader>j :Buffers<cr>
nmap <leader>h :History<cr>
nmap <leader>t :Tags<cr>
nmap <leader>c :History:<cr>

" GitGutter
nmap ghp <Plug>GitGutterPreviewHunk
nmap ghs <Plug>GitGutterStageHunk
nmap ghu <Plug>GitGutterUndoHunk

"""""""""""""""""""""""""""""""""""""""""""""""""
" General configs
"
"""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
if has('gui_running')
  set guifont=Iosevka:h12
  set lines=40 columns=120
  " Avoid garbled characters in Chinese language windows OS
  let $LANG='en'
  set langmenu=en
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
else
  set t_Co=256
endif

set background=dark
set lazyredraw
set ttyfast
" Reduce delay when exiting insert mode
set ttimeoutlen=10
set updatetime=100
set laststatus=2
set noshowmode
set wildmenu
" Turn backup off
set nobackup
set nowb
set noswapfile
set hidden
set autoread


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
" Shift to certain columns, not just n spaces
set shiftround
" Break long lines by word instead of char
set linebreak

set scrolloff=3

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=1

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set clipboard=exclude:.*

" Adjust appear location of splits
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

" Configure backspace so it acts as it should act
set backspace=eol,start,indent


"""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""
" For fast quitting and saving, no more :W bullshit
command! Q q
command! W w
nmap <leader>w :w<cr>
nmap <leader>x :x<cr>
nmap <leader>q :q<cr>

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

"""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"
"""""""""""""""""""""""""""""""""""""""""""""""""
" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
silent !mkdir -p ~/.vim/undodir
set undodir=~/.vim/undodir
set undofile

try
  source ~/dotfiles/my_configs.vim
catch
endtry
