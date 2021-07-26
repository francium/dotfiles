function! Plugin_InitEmmet()
    let g:user_emmet_install_global = 0
    autocmd FileType html,css EmmetInstall
endfunction

Plug 'https://github.com/mattn/emmet-vim', {'for': ['html', 'css', 'eruby', 'svelte']}
autocmd! User emmet-vim call Plugin_InitEmmet()
