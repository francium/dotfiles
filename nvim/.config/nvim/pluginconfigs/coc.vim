" Alternatively try the "for" Plug option to load for some files only instead
" of every kind of file and language

" only enable if `coc` env var set
if $coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    set cmdheight=1
    set updatetime=300
    set shortmess+=c
    set signcolumn=yes

    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)

    " See `help coc-nvim
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gD <Plug>(coc-declaration>
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gR <Plug>(coc-refactor)
    nmap <silent> gH <Plug>(coc-float-hide)
    imap <silent> <c-g><c-g> <Plug>(coc-float-hide)
    nmap <silent> gaf <Plug>(coc-funcobj-a)
    nmap <silent> gif <Plug>(coc-funcobj-i)

    " Remap for rename current word
    nmap <leader>rn <Plug>(coc-rename)

    " Use trigger completion
    inoremap <silent><expr> <c-l> coc#refresh()

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
    endfunction

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a <Plug>(coc-codeaction-selected)
    nmap <leader>a <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Add status line support, for integration with other plugin, checkout `:h coc-status`
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    function! _cocrestart()
        echo "Restarting COC"
        syntax off
        CocRestart
        syntax on
    endfunction
    nmap <leader><f5> :call _cocrestart()<CR>
endif

