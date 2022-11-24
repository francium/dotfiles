set tw=80
setlocal nowrap

" Concealing some markdown syntax (use with vim-markdown)
setlocal conceallevel=3
    " 3 = always conceal

" Hide and show the concealed characters when entering/exiting insert mode
autocmd InsertEnter * setlocal conceallevel=0
autocmd InsertLeave * setlocal conceallevel=3
