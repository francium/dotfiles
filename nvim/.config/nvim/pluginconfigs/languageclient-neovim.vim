" only enable if `langclient` env var set
if $langclient
    Plug 'https://github.com/autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
    \ }

    let g:LanguageClient_serverCommands = {
        \ 'typescript': ['language-server-stdio'],
        \ 'c': ['clangd-8'],
        \ 'c++': ['clangd-8'],
        \ 'h': ['clangd-8'],
        \ }
    let g:LanguageClient_rootMarkers = {
        \ 'typescript': ['tsconfig.json'],
        \ }

    nnoremap <silent> <leader>k K
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <leader>ac :call LanguageClient_contextMenu()<CR>
endif
