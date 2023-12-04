" Disable some defaults /usr/share/nvim/runtime/ftplugin/markdown.vim sets
let g:markdown_recommended_style=0

set tw=80
set sw=2 ts=2
setlocal nowrap

let g:markdown_conceallevel=3
  " 1 = conceal, but leave whitespace where concealed character is
  " 3 = always conceal

" Concealing some markdown syntax (use with vim-markdown)
" Set option locally (`let &l:foo` is equivalent to `setlocal foo=...`, you
" use use a variable if you do setlocal foo=<variable>)
let &l:conceallevel=g:markdown_conceallevel

" Hide and show the concealed characters when entering/exiting insert mode
autocmd InsertEnter * setlocal conceallevel=0
" autocmd InsertLeave * let &l:conceallevel=g:markdown_conceallevel
" TODO:
"   Error detected while processing InsertLeave Autocommands for "*":
"   E521: Number required after =: conceallevel=g:markdown_conceallevel
autocmd InsertLeave * let &l:conceallevel=3

nmap <buffer> <leader>vv :TocV<cr>
nmap <buffer> <leader>ap :call FormatMarkdown()<cr>

com! Todo e todo/index.md
com! TodoDone e todo/done.md
com! WikiPush !wiki -c
