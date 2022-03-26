Plug 'https://github.com/mhinz/vim-signify'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change = '~'
let g:signify_sign_change_delete = g:signify_sign_change . g:signify_sign_delete_first_line

" nnoremap ghp :SignifyDiff<cr>
nnoremap ghp :SignifyHunkDiff<cr>
nnoremap ghu :SignifyHunkUndo<cr>

" hunk jumping
nmap ]h <plug>(signify-next-hunk)
nmap [h <plug>(signify-prev-hunk)
