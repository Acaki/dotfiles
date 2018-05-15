set number relativenumber
let g:airline_powerline_fonts = 1
set termguicolors
color onedark
let g:ale_fixers = {
      \  'javascript': ['standard'],
      \}
let g:ale_set_highlights = 0
nmap <leader>af = :ALEFix<CR>
nmap <silent> <leader>an <Plug>(ale_next)
nmap <silent> <leader>ap <Plug>(ale_previous)
nmap <leader><leader>t :vert ter ++kill=SIGINT<CR>
tmap <C-w>q <C-w>:hide<CR>
tmap <C-n> <C-w>N<CR>
tmap <C-h> <C-W>h
tmap <C-j> <C-W>j
tmap <C-k> <C-W>k
tmap <C-l> <C-W>l
