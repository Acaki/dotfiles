let g:airline_powerline_fonts = 1
set termguicolors
color onedark
let g:ale_fixers = {
      \  'javascript': ['standard'],
      \}
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
nmap <silent> <leader>j <Plug>(ale_next_wrap)
nmap <silent> <leader>k <Plug>(ale_previous_wrap)
