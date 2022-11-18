" This can be slow on older computers with a lot of text being displayed,
" enable on a per machine basis

function! __Install_VirtColumn()
    if $vim_virt
        if !has('nvim-0.6.0')
            return
        endif

        Plug 'https://github.com/lukas-reineke/virt-column.nvim'
    endif
endfunction

function! __Configure_VirtColumn()
    if $vim_virt
        if !has('nvim-0.6.0')
            return
        endif

lua << EOF
        require("virt-column").setup { char = "│" }
EOF
    endif
endfunction
