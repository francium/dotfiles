" Fixes -----------------------------------------------------------------------
" If you use vim inside tmux, see https://github.com/vim/vim/issues/993
" " set Vim-specific sequences for RGB colors
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum

" Light colorshcmes background issue
set t_ut=

if (has("termguicolors"))
    set termguicolors
endif
" -----------------------------------------------------------------------------


function! SourceModules()
    source ~/.config/nvim/util.vim
    source ~/.config/nvim/plugins.vim
    source ~/.config/nvim/mappings.vim
    if filereadable(expand('~/.vim_private/init.vim'))
        source ~/.vim_private/init.vim
    endif
endfunction


function! BaseConfig()
    if !exists('g:syntax_on')
        syntax enable
    endif

    " File specific settings
    filetype plugin indent on

    " Set undo limit
    set undolevels=25000

    " Allow switching buffers without saving
    set hidden

    " Spelling
    set spell

    " Encoding
    "   Needed by vim-devicon
    set encoding=UTF-8

    " Case insensitive searching by default, overridden by capitalized characters
    set ignorecase
    set smartcase

    set shiftround

    " Highlight current line
    set cursorline

    " Don't softwrap lines
    set nowrap

    " Disable swapfiles
    set noswapfile

    " 90 column warning
    " only add to file buffer instead of non-file buffers like coc
    " and NERDTree -- does result in extension-less files not receiving
    " colorcolumns
    autocmd FileType * setlocal colorcolumn=80,90,100

    " Text width
    " 0 = no wrapping
    set tw=0

    " Show special characters
    set list

    " Show tabs
    set listchars=tab:░░

    " Status line
    set laststatus=2

    " Line numbers
    set number

    " Scroll padding
    set so=2

    " No tab characters
    set expandtab

    " Relative numbering seems to be fast enough when using Alacritty
    set relativenumber

    " Fix folding issues (things folding automatically)
    set foldlevelstart=99

    " Indenting and tabbing
    set sw=4
    set ts=4

    " Fix deoplete being too eager and selecting first option automatically
    " set completeopt+=noinsert
    set completeopt =longest,menu
    " set completeopt-=preview

    " Backup files (~ files)and write directly instead of temp file (and rename)
    " to avoid issues with some build tools that watch files
    set nobackup
    set nowritebackup
    set backupcopy=yes

    " Splitting
    " set splitbelow
    " set splitright

    " Disable mouse clicking (scrolling not affected)
    autocmd BufEnter * set mouse=

    " Terminal
        " Start in insert mode
        autocmd BufWinEnter,WinEnter term://* startinsert

        autocmd TermOpen * setlocal nospell
        autocmd TermOpen * setlocal  nonumber norelativenumber

    " Add suffixes for related files so `gf` works for files without extensions
    augroup suffixes
        autocmd!

        let associations = [
            \["javascript", ".js,.jsx,.ts,.tsx"],
        \]

        for ft in associations
            execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
        endfor
    augroup END
endfunction


" Triger `autoread` when files changes on disk
" Source: https://unix.stackexchange.com/a/383044
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
function! BaseConfig_AutoReloadFileOnChange()
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | silent! checktime | endif
    " Notification after file change
    " https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
    autocmd FileChangedShellPost *
    \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
endfunction


" Pretty folded text ----------------------------------------------------------
" `foo { ... }`
" Source: https://coderwall.com/p/usd_cw/a-pretty-vim-foldtext-function
function! BaseConfig_FoldText()
    set foldtext=FoldText()
    function! FoldText()
        let l:lpadding = &fdc
        redir => l:signs
        execute 'silent sign place buffer='.bufnr('%')
        redir End
        let l:lpadding += l:signs =~ 'id=' ? 2 : 0

        if exists("+relativenumber")
        if (&number)
            let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
        elseif (&relativenumber)
            let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
        endif
        else
        if (&number)
            let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
        endif
        endif

        " expand tabs
        let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
        let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

        let l:info = ' (' . (v:foldend - v:foldstart) . ')'
        let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
        let l:width = winwidth(0) - l:lpadding - l:infolen

        let l:separator = ' … '
        let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
        let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
        let l:text = l:start . ' … ' . l:end

        return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
    endfunction
endfunction


" " Disable parentheses matching depends on system. This way we should address all cases (?)
" set noshowmatch
" " NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" " Trying disable MatchParen after loading all plugins
" "
" function! g:FckThatMatchParen ()
"     if exists(":NoMatchParen")
"         :NoMatchParen
"     endif
" endfunction
"
" augroup plugin_initialize
"     autocmd!
"     autocmd VimEnter * call FckThatMatchParen()
" augroup END


" NOTE: To be able to override color highlighting, all highlighting commands
" must be after the calls to
" ```
" filetype plugin indent on
" syntax on
" ```
call BaseConfig()
call BaseConfig_AutoReloadFileOnChange()
call BaseConfig_FoldText()
call SourceModules()
