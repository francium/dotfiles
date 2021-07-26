Plug 'https://github.com/airblade/vim-gitgutter'

let g:gitgutter_map_keys = 0 " Disable default key mappings
nmap <leader>hn <Plug>(GitGutterNextHunk)
nmap <leader>hp <Plug>(GitGutterPrevHunk)
nmap <leader>hs <Plug>(GitGutterPreviewHunk)
nmap <leader>hS <Plug>(GitGutterStageHunk)
nmap <leader>hX <Plug>(GitGutterUndoHunk)
