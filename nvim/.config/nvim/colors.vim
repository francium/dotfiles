function! LoadColors()
    Plug 'https://github.com/rakr/vim-one'
    Plug 'https://github.com/lifepillar/vim-gruvbox8'
    Plug 'https://github.com/arzg/vim-colors-xcode'
    Plug 'https://github.com/tobi-wan-kenobi/zengarden'
    Plug 'https://github.com/adigitoleo/vim-mellow'
    Plug 'https://github.com/Biscuit-Colorscheme/nvim'
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

    if $vim_virt
        " virt-column is being used instead
        hi clear ColorColumn
    endif

    " HTML and Markdown links link to this highlight group.
    if $d
        hi Underlined gui=underline guifg=#ff8a7a
    endif

    " Whitespace is used for tabs (Go, Makefile)
    if $d
        hi Whitespace ctermfg=15 guifg=#666666
    else
        hi Whitespace ctermfg=15 guifg=#e0e0e0
    endif

    " Using a double underline ensure underscores in text aren't ambiguous
    hi SpellBad cterm=underdouble gui=underdouble guisp=Red
    hi SpellCap cterm=underdouble gui=underdouble guisp=Blue
    hi SpellRare cterm=underdouble gui=underdouble guisp=Magenta
    hi SpellLocal cterm=underdouble gui=underdouble guisp=DarkCyan
    hi VertSplit guifg=#52555c guibg=NONE

    " coc added a custom popup menu for completions,
    " https://github.com/neoclide/coc.nvim/issues/4031
    hi CocSearch guifg=White guibg=#156ADF
    hi CocMenuSel guifg=White guibg=#156ADF

    hi IncSearch guifg=#1f1f24 guibg=#FEA837
    hi Search guifg=#1f1f24 guibg=#fef937
    if $d
        hi CocDeprecatedHighlight cterm=undercurl gui=undercurl guisp=#E9AD0C
        hi CocHintHighlight cterm=undercurl gui=undercurl guisp=#2A7BDE
        hi CocInfoHighlight cterm=undercurl gui=undercurl guisp=#2A7BDE
        hi CocWarningHighlight cterm=undercurl gui=undercurl guisp=#E9AD0C
        hi CocErrorHighlight cterm=undercurl gui=undercurl guisp=#FF0000
        hi CocFadeOut cterm=undercurl gui=undercurl guisp=#E9AD0C

        hi Folded guifg=NONE guibg=#303030
        hi Directory guifg=#FF5298 gui=bold
        hi ExtraWhitespace guifg=#FFF8F8
    else
        hi CocDeprecatedHighlight cterm=undercurl gui=undercurl guisp=#E9AD0C
        hi CocHintHighlight cterm=undercurl gui=undercurl guisp=#2A7BDE
        hi CocInfoHighlight cterm=undercurl gui=undercurl guisp=#2A7BDE
        hi CocWarningHighlight cterm=undercurl gui=undercurl guisp=#E9AD0C
        hi CocErrorHighlight cterm=undercurl gui=undercurl guisp=#FF0000
        hi CocFadeOut cterm=undercurl gui=undercurl guisp=#E9AD0C

        hi Folded guifg=NONE guibg=#f3f3f3
        hi Directory guifg=#0058a1 gui=bold
        hi ExtraWhitespace guifg=#500000
    endif
endfunction

function ConfigureMellow()
    colo mellow

    " vim-mellow overrides
    " Match Normal (dark)
    hi EndOfBuffer ctermbg=232 guibg=#0f0908
    hi LineNr ctermfg=223 ctermbg=232 guifg=#eccd9d guibg=#0f0908
    hi CursorLine ctermbg=235 guibg=#291815
    hi CursorLineNr ctermbg=235 guibg=#291815
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
