call plug#begin()
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/christoomey/vim-tmux-navigator'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/jistr/vim-nerdtree-tabs'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/mattn/emmet-vim'
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/simeji/winresizer'
Plug 'https://github.com/thirtythreeforty/lessspace.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/w0rp/ale'

" Colorschemes
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/rakr/vim-one'
call plug#end()


" ALE -------------------------------------------------------------------------
let g:ale_lint_delay = 1000


" FZF -------------------------------------------------------------------------
nmap <leader>f :FZF<CR>
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'


" Lightline ------------------------------------------------------------------
" Don't show default mode label
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'fugitive', 'readonly', 'filename', 'mode', 'paste' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '│', 'right': '│' }
      \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return 'RO'
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' ⎇  '.branch : ''
  endif
  return ''
endfunction


" NERDTreee ------------------------------------------------------------------
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


" NERDTREE tabs --------------------------------------------------------------
" Map Ctrl+n to toggle (Using nerdtree tabs instead)
map <C-n> :NERDTreeTabsToggle<CR>

" Open on console startup
let g:nerdtree_tabs_open_on_console_startup = 0


" NERDCommenter --------------------------------------------------------------
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '//','right': '' } }

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" Vim-Tmux-Navigator ---------------------------------------------------------
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>


" winresizer -------------------------------------------------------------------
let g:winresizer_start_key = 'foobar'
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
nmap <Leader>e :WinResizerStartResize<CR>
