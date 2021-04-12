" Alternatively try the "for" Plug option to load for some files only instead
" of every kind of file and language

" only enable if `coc` env var set
if !$coc
    " Otherwise, enable lazy loading to ensure it does get installed
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': []}
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    set cmdheight=1
    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    set signcolumn=yes

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

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
    inoremap <silent><expr> <c-j> coc#refresh()

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

    " Format buffer
    nnoremap <silent> g= :call CocAction('format')<CR>
    vnoremap <silent> g= <Plug>(coc-format-selected)

    function! _cocrestart()
        echo "Restarting COC"
        syntax off
        CocRestart
        syntax on
    endfunction
    nmap <leader><f5> :call _cocrestart()<CR>
endif

