color nord
let g:lightline['separator'] = { 'left': '', 'right': '' }
let g:lightline['subseparator'] = { 'left': '', 'right': '' }
" Search the word under the cursor using Rg
nnoremap <silent> <leader>g :Rg <C-R><C-W><CR>

nmap <leader><leader>t :vert ter ++kill=kill<CR>
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

