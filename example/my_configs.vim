set termguicolors
color onedark
let g:lightline['colorscheme'] = 'onedark'
set signcolumn=yes
let g:ale_fixers = {
      \  'javascript': ['standard']
      \}
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
let g:ale_set_highlights = 0
set completeopt-=preview
let g:ycm_collect_identifiers_from_tags_files = 1
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
nmap <leader>af = :ALEFix<CR>
nmap <C-n> <Plug>(ale_next_wrap)
nmap <C-p> <Plug>(ale_previous_wrap)
nmap <leader><leader>t :vert ter ++kill=kill<CR>
tmap <C-W>q <C-W>:hide<CR>
tmap <C-W>gt <C-W>:tabn<CR>
tmap <C-W>gT <C-W>:tabp<CR>
tmap <C-h> <C-W>h
tmap <C-j> <C-W>j
tmap <C-k> <C-W>k
tmap <C-l> <C-W>l
