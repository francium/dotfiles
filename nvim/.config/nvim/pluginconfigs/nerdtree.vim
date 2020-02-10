Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/jistr/vim-nerdtree-tabs'

" Don't focus nerd tree
autocmd VimEnter * wincmd p

" Show hidden files
let NERDTreeShowHidden=1

" Map Ctrl+n to toggle (Using nerdtree tabs instead)
" map <C-n> :NERDTreeToggle<CR>

" Close with last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif

" Auto start when no files specified (Using nerdtree tabs intead)
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeIgnore = [ '\.swp$',
                     \ '\.swo$',
                     \ '\.pyc$',
                     \ '__pycache__$',
                     \ '\.egg-info$',
                     \ '\.git$' ]

nmap <leader>g :NERDTreeFind<CR>


" NERDTREE tabs --------------------------------------------------------------
" Map Ctrl+n to toggle (Using nerdtree tabs instead)
nmap <C-n> :NERDTreeTabsToggle<CR>

" Open on console startup
let g:nerdtree_tabs_open_on_console_startup = 0
