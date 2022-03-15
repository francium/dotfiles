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
    Plug 'https://github.com/tomasiser/vim-code-dark'
endfunction

function! PostLoadColors()
    " Must be set before bg
    let g:gruvbox_transp_bg = 1

    if !empty($d)
        set bg=dark
    else
        set bg=light
    endif

    if !empty($colo)
        color $colo
    else
        if $d
            let g:xcodedarkhc_green_comments = 1
            let g:xcodedarkhc_dim_punctuation = 1
            let g:xcodedarkhc_match_paren_style = 0
            colo xcodedarkhc
            hi Normal guibg=#000000
            hi EndOfBuffer guibg=#000000
            hi Search guifg=#000000 guibg=#FFC42E
            hi Folded guifg=#9398A4
            hi DiffAdd guifg=#b1faeb guibg=#1e2a28 gui=NONE cterm=NONE
            hi DiffDelete guifg=#ff8a7a guibg=#2f2625 gui=NONE cterm=NONE
            hi Directory guifg=#ef768e
            hi IdentifierDef guifg=#ef768e
            hi LibraryFunc guifg=#ffb7a1 guibg=NONE gui=NONE cterm=NONE
            hi LibraryType guifg=#ffb7a1 guibg=NONE gui=NONE cterm=NONE
            hi LocalType guifg=#d654a4 guibg=NONE gui=NONE cterm=NONE
            hi LocalFunc guifg=#d654a4 guibg=NONE gui=NONE cterm=NONE
            hi LocalIdent guifg=#d654a4 guibg=NONE gui=NONE cterm=NONE
            hi Special guifg=#d67054 guibg=NONE gui=NONE cterm=NONE
            hi markdownDelimiter guifg=#ffa96b
            hi Underlined guifg=#ffa96b
        else
            let g:xcodelighthc_green_comments = 1
            let g:xcodelighthc_dim_punctuation = 1
            let g:xcodelighthc_match_paren_style = 1
            colo xcodelighthc
        endif
    endif

    " call ConfigureVimOneColors()

    " Highlight conflict markers
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
endfunction

" function! ConfigureVimOneColors()
"     if &background ==# "dark"
"         " call one#highlight('Normal', '', '111111', '')
"         " call one#highlight('Comment', '888888', '', '')
"     else
"         " call one#highlight('Comment', '668BB0', '', '')
"         call one#highlight('CursorLine', '', 'e8e8e8', '')
"     endif
" endfunction
