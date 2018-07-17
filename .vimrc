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

Plug 'itchyny/lightline.vim'
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
" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['fugitive'], ['readonly', 'relativepath', 'modified']],
      \   'right': [['lineinfo'], ['percent'], ['linter_warnings', 'linter_errors', 'linter_ok']] 
      \ },
      \ 'component_expand': {
      \   'linter_warnings': 'LightlineLinterWarnings',
      \   'linter_errors': 'LightlineLinterErrors',
      \   'linter_ok': 'LightlineLinterOK'
      \ },
      \ 'inactive': {
      \   'left': [['filename']],
      \   'right': [['lineinfo']]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive'
      \ },
			\ 'component_type': {
			\   'linter_warnings': 'warning',
			\   'linter_errors': 'error'
			\ }
      \ }
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

" https://github.com/statico/dotfiles/blob/master/.vim/vimrc
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

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
set mat=0

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
" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
set diffopt=vertical

" Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
silent !mkdir -p ~/.vim/undodir
set undodir=~/.vim/undodir
set undofile

try
  source ~/dotfiles/my_configs.vim
catch
endtry
