set termguicolors
set scrolljump=10
color onedark
let g:airline_powerline_fonts = 1
let g:ale_fixers = {
      \  'javascript': ['standard'],
      \}
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
set completeopt-=preview
nmap <leader>af = :ALEFix<CR>
nmap <leader>an <Plug>(ale_next_wrap)
nmap <leader>ap <Plug>(ale_previous_wrap)
nmap <leader><leader>t :vert ter ++kill=kill<CR>
tmap <C-W>q <C-W>:hide<CR>
tmap <C-W>gt <C-W>:tabn<CR>
tmap <C-W>gT <C-W>:tabp<CR>
tmap <C-h> <C-W>h
tmap <C-j> <C-W>j
tmap <C-k> <C-W>k
tmap <C-l> <C-W>l
