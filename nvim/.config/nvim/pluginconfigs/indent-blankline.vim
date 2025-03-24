" This can be slow on older computers with a lot of text being displayed,
" enable on a per machine basis

function __Install_IndentBlankline()
    Plug 'lukas-reineke/indent-blankline.nvim'
endfunction

function __Configure_IndentBlankline()
    if $vim_virtcolumn
lua << EOF
        require("ibl").setup {}
EOF
        " hi IndentBlanklineChar cterm=nocombine ctermfg=15 gui=nocombine guifg=#f0f0f0
            " You can also edit the color, but it also results in the cursor taking
            " same color when it's over, resulting in harder to see cursor when the
            " contrast between the background is too low
    endif
endfunction
