function! Plugin_InitEmmet()
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,php EmmetInstall
endfunction

Plug 'https://github.com/mattn/emmet-vim', {'for': ['html', 'css', 'php', 'eruby', 'svelte', 'typescriptreact', 'javascriptreact']}
autocmd! User emmet-vim call Plugin_InitEmmet()
