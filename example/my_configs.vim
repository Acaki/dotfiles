" For italic characters
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
" Enable true color support
set termguicolors
color nord
let g:lightline['colorscheme'] = 'nord'
let g:lightline['separator'] = { 'left': '', 'right': '' }
let g:lightline['subseparator'] = { 'left': '', 'right': '' }
set signcolumn=yes
set number
set relativenumber
let g:ale_fixers = {
      \  'javascript': ['prettier_eslint'],
      \  'php': ['php_cs_fixer']
      \}
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_set_highlights = 0
set completeopt-=preview
nmap <leader>a = :ALEFix<CR>
nmap <C-n> <Plug>(ale_next_wrap)
nmap <C-p> <Plug>(ale_previous_wrap)
nmap <leader><leader>t :vert ter ++kill=kill<CR>
" Search the word under the cursor using Rg
nnoremap <silent> <leader>g :Rg <C-R><C-W><CR>
tmap <C-W>q <C-W>:hide<CR>
tmap <C-W>gt <C-W>:tabn<CR>
tmap <C-W>gT <C-W>:tabp<CR>
tmap <C-h> <C-W>h
tmap <C-j> <C-W>j
tmap <C-k> <C-W>k
tmap <C-l> <C-W>l

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
