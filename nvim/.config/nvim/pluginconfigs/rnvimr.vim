Plug 'https://github.com/kevinhwang91/rnvimr'

nnoremap <leader><tab> :RnvimrToggle<CR>

" Close when in terminal (ranger is open)
tnoremap <leader><tab> <c-\><c-n>:RnvimrToggle<CR>

" Open and focus current file
function RnvimrOpenPWD()
    let dir=system("pwd")
    execute "e " . dir
endfunction
nnoremap <leader><tab> :call RnvimrOpenPWD()<CR>

" Open project root
nnoremap <leader>gg :e %:p:h<CR>

" Make Ranger replace Netrw and be the file explorer
let g:rnvimr_enable_ex = 1

" Make Ranger to be hidden after picking a file
let g:rnvimr_enable_picker = 1

" Make Neovim wipe the buffers corresponding to the files deleted by Ranger
let g:rnvimr_enable_bw = 1

" Change the border's color
let g:rnvimr_border_attr = {'fg': 4, 'bg': -1}

" Customize the initial layout
let g:rnvimr_layout = {
\   'relative': 'editor',
\   'width': float2nr(round(0.95 * &columns)),
\   'height': float2nr(round(0.9 * &lines)),
\   'col': float2nr(round(0.025 * &columns)),
\   'row': 0,
\   'style': 'minimal'
\}
