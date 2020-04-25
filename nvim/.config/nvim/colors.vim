function! LoadColors()
    Plug 'https://github.com/rakr/vim-one'
    " Plug 'https://github.com/w0ng/vim-hybrid'
    " Plug 'https://github.com/NLKNguyen/papercolor-theme'
    " Plug 'https://github.com/gruvbox-community/gruvbox'
    Plug 'https://github.com/lifepillar/vim-gruvbox8'
    " Plug 'https://github.com/endel/vim-github-colorscheme'
    " Plug 'https://github.com/srcery-colors/srcery-vim'
    " Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'https://github.com/arzg/vim-colors-xcode'
endfunction

function! PostLoadColors()
    " Must be set before bg
    let g:gruvbox_transp_bg = 1

    if $d
        set bg=dark
        colo gruvbox8_hard
    else
        set bg=light
        colo one
    endif

    call ConfigureVimOneColors()
endfunction

function! ConfigureVimOneColors()
    if &background ==# "dark"
        " call one#highlight('Normal', '', '111111', '')
        " call one#highlight('Comment', '888888', '', '')
    else
        " call one#highlight('Comment', '668BB0', '', '')
        call one#highlight('CursorLine', '', 'e8e8e8', '')
    endif
endfunction
