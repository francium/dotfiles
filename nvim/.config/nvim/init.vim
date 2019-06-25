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

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/mappings.vim

" Spelling
set spell

" Case insensitive searching by default
set ignorecase

" Highlight current line
set cursorline

" Us memory for swapfiles -- Won't be able to recover files after a system
" crash, but will allow warning when opening the same file in multiple
" instances
" Double slash tells vim to use full filename to avoid collisions
set directory=/dev/shm//

" Color
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_contrast_light='hard'
set bg=light
colo one

" 90 column warning
" set colorcolumn=80,90
" Margin at 80 and solid background after 90
let &colorcolumn=80 . "," . join(range(90,500),",")

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

" Triger `autoread` when files changes on disk
" Source: https://unix.stackexchange.com/a/383044
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
