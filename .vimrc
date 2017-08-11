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
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPMRU']}
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/syntastic', { 'on': 'SyntasticCheck' }
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'

call plug#end()

let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration for specific plugins 
"
"""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>n :NERDTreeToggle<cr>
" Open NERDTree panel on the right side
let g:NERDTreeWinPos = "right"

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename', 'modified' ] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype' ] ]
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction
let g:syntastic_mode_map = { 'mode': 'passive' }
augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp,*.php,*.js call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

nmap <leader>f :CtrlP<cr>
nmap <leader>j :CtrlPMRU<cr>
" Fix for slow exiting
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


"""""""""""""""""""""""""""""""""""""""""""""""""
" General configs
"
"""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized
set autoread
" For gitgutter to update faster
set updatetime=250
set laststatus=2
set noshowmode
set hidden
set wildmenu
if !has('gui_running')
  set t_Co=256
endif


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
