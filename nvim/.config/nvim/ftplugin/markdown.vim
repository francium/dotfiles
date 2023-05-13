" Disable some defaults /usr/share/nvim/runtime/ftplugin/markdown.vim sets
let g:markdown_recommended_style=0

set tw=80
set sw=2 ts=2
setlocal nowrap

" Concealing some markdown syntax (use with vim-markdown)
setlocal conceallevel=3
    " 3 = always conceal

" Hide and show the concealed characters when entering/exiting insert mode
autocmd InsertEnter * setlocal conceallevel=0
autocmd InsertLeave * setlocal conceallevel=3

nmap <buffer> <leader>vv :TocV<cr>
