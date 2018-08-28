" For italic characters
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
" Enable true color support
color nord
let g:lightline['colorscheme'] = 'nord'
let g:lightline['separator'] = { 'left': '', 'right': '' }
let g:lightline['subseparator'] = { 'left': '', 'right': '' }
" Search the word under the cursor using Rg
nnoremap <silent> <leader>g :Rg <C-R><C-W><CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
