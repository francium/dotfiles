function! __Install_VirtColumn()
    if !has('nvim-0.6.0')
        return
    endif

    Plug 'https://github.com/lukas-reineke/virt-column.nvim'
endfunction

function! __Configure_VirtColumn()
    if !has('nvim-0.6.0')
        return
    endif

lua << EOF
    require("virt-column").setup { char = "│" }
EOF
endfunction
