source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim

" Color
colo one
if $d
    set bg=dark
else
    set bg=light
endif
" highlight Folded guifg=NONE guibg=#302D2A gui=bold

" undo history
set undolevels=25000

" Hidden buffers
" Required by some plugins to allow refactoring
set hidden

" Number of items in completion menu
set pumheight=10

" Spelling
set spell

" Case insensitive searching by default
set ignorecase
set smartcase

" Highlight current line
set cursorline

" Use memory for swapfiles -- Won't be able to recover files after a system
" crash, but will allow warning when opening the same file in multiple
" instances
" Double slash tells vim to use full filename to avoid collisions
set directory=/dev/shm//

" Time to write swapfile to disk (improves coc.vim responsiveness)
" Use with in memory swap files to reduce disk io
set updatetime=300


" 90 column warning
set colorcolumn=80,90,100
" Margin at 80 and solid background after 90
" let &colorcolumn=80 . "," . join(range(90,500),",")

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

" Text width
" 0 = no wrapping
set tw=0

" No tab characters
set expandtab

" Indenting and tabbing
set sw=4
set ts=4

" File specific settings
filetype plugin indent on

" Backup files (~ files)and write directly instead of temp file (and rename)
" to avoid issues with some build tools that watch files
set nobackup
set nowritebackup
set backupcopy=yes

" Splitting
set splitbelow
set splitright

" Disable mouse clicking (scrolling not affected)
autocmd BufEnter * set mouse=

" Terminal
" Start in insert mode
autocmd BufWinEnter,WinEnter term://* startinsert
" Disable spelling and line numbers
autocmd TermOpen term://* set nospell | set nonu

" {{{ Triger `autoread` when files changes on disk ----------------------------
" Source: https://unix.stackexchange.com/a/383044
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" }}} -------------------------------------------------------------------------

" {{{ Pretty folded text ------------------------------------------------------
" `foo { ... }`
" Source: https://coderwall.com/p/usd_cw/a-pretty-vim-foldtext-function
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
" }}} -------------------------------------------------------------------------

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

" vim: set foldmethod=marker:
