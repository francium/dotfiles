" Alternatively try the "for" Plug option to load for some files only instead
" of every kind of file and language

" only enable if `coc` env var set
if !$coc
    " Otherwise, enable lazy loading to ensure it does get installed
    Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': []}
else
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    set cmdheight=1
    " don't give |ins-completion-menu| messages.
    set shortmess+=c
    set signcolumn=yes

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> [c <Plug>(coc-diagnostic-prev-error)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)
    nmap <silent> ]c <Plug>(coc-diagnostic-next-error)
    nmap <silent> [[c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]]c <Plug>(coc-diagnostic-next)

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
    nnoremap <silent> <c-w>k <Plug>(coc-float-jump)

    " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
    xmap <leader>a <Plug>(coc-codeaction-selected)
    nmap <leader>a <Plug>(coc-codeaction-selected)

    " Remap for do codeAction of current line
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Fix autofix problem of current line
    nmap <leader>af  <Plug>(coc-fix-current)

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
    nnoremap <silent> <leader>ap :call CocAction('format')<CR>

    " Organize imports
    command! -nargs=0  OrganizeImports :call CocAction('runCommand', 'editor.action.organizeImport')
    nmap <leader>o :OrganizeImports<cr>

    function! _cocrestart()
        echo "Restarting COC"
        CocRestart
    endfunction
    nmap <leader><f5> :call _cocrestart()<CR>
endif

