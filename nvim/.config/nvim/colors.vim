function! LoadColors()
    Plug 'https://github.com/rakr/vim-one'
    Plug 'https://github.com/lifepillar/vim-gruvbox8'
    Plug 'https://github.com/arzg/vim-colors-xcode'
endfunction

function! PostLoadColors()
    if !empty($d)
        set bg=dark
    else
        set bg=light
    endif

    call ConfigureColorscheme()
    call ConfigureLightlineColors()

endfunction

function ConfigureColorscheme()
    if !empty($colo)
        color $colo
    else
        let g:xcodedarkhc_green_comments = 1
        let g:xcodedarkhc_dim_punctuation = 1
        if $d
            let g:xcodedarkhc_match_paren_style = 0
            colo xcodedarkhc

        else
            let g:xcodelighthc_match_paren_style = 1
            colo xcodelighthc

        endif
    endif

    hi clear ColorColumn
        " virt-column is being used instead
    hi IncSearch guifg=#1f1f24 guibg=#FEA837
    hi Search guifg=#1f1f24 guibg=#fef937
    if $d
        hi CocFadeOut guifg=NONE guibg=#311c1b cterm=NONE gui=NONE
        hi Folded guifg=NONE guibg=#303030
        hi Directory guifg=#FF5298 gui=bold
    else
        hi CocFadeOut guifg=NONE guibg=#f4f4f4 cterm=NONE gui=NONE
        hi Folded guifg=NONE guibg=#f3f3f3
        hi Directory guifg=#0058a1 gui=bold
    endif
endfunction

function ConfigureLightlineColors()
    if $d
        let g:lightline.colorscheme = 'deus'
    else
        let g:lightline.colorscheme = 'PaperColor'
    endif
    call lightline#update()
    call lightline#disable()
    call lightline#enable()
endfunction
