set number relativenumber
set termguicolors
set scrolljump=10
color onedark
let g:airline_powerline_fonts = 1
let g:ale_fixers = {
      \  'javascript': ['standard'],
      \}
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ycm_autoclose_preview_window_after_insertion = 1
nmap <leader>af = :ALEFix<CR>
nmap <leader>an <Plug>(ale_next_wrap)
nmap <leader>ap <Plug>(ale_previous_wrap)
nmap <leader><leader>t :vert ter<CR>
tmap <C-w>q <C-W>:hide<CR>
tmap <C-h> <C-W>h
tmap <C-j> <C-W>j
tmap <C-k> <C-W>k
tmap <C-l> <C-W>l
