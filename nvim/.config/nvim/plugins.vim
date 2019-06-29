call plug#begin()
Plug 'https://github.com/Shougo/denite.nvim'
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/andymass/vim-matchup'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'https://github.com/christoomey/vim-tmux-navigator'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/jistr/vim-nerdtree-tabs'
Plug 'https://github.com/junegunn/fzf.vim'
Plug 'https://github.com/justinmk/vim-sneak'
Plug 'https://github.com/kshenoy/vim-signature'
Plug 'https://github.com/ludovicchabant/vim-gutentags'
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/simeji/winresizer'
Plug 'https://github.com/thirtythreeforty/lessspace.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-sensible'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/w0rp/ale'

" Elm
" Fork with some fixes
Plug 'https://github.com/francium/elm-vim', {'for': 'elm'}
    " elm-vim relies on Elm Oracle, which doesn't support Elm 0.19, so disable
    " for now
    autocmd BufEnter *.elm execute 'call deoplete#disable()'
    autocmd BufLeave *.elm execute 'call deoplete#enable()'

" HTML
Plug 'https://github.com/mattn/emmet-vim', {'for': 'html'}

" Typescript
Plug 'https://github.com/leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'https://github.com/HerringtonDarkholme/yats.vim', {'for': 'typescript'}
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    let g:nvim_typescript#default_mappings=1
    " TODO: Map :TS* commands to shortcuts only for *.ts files
    " TODO: Research and fix
    " autocmd! BufEnter *.ts noremap gh :TSDefPreview<CR>
    " autocmd! BufLeave *.ts nunmap gh

" Rust
Plug 'https://github.com/rust-lang/rust.vim', {'for': 'rust'}

" Zig
Plug 'https://github.com/ziglang/zig.vim', {'for': 'zig'}

" Colorschemes
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/rakr/vim-one'
Plug 'https://github.com/endel/vim-github-colorscheme'
Plug 'https://github.com/srcery-colors/srcery-vim'
call plug#end()


" ALE -------------------------------------------------------------------------
let g:ale_lint_delay = 1000


" Deoplete --------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1


" Emmet Vim -------------------------------------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" FZF -------------------------------------------------------------------------
nmap <leader>; :Commands<CR>
nmap <leader>f :FZF<CR>
nmap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<space>
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --exclude node_modules --exclude venv --exclude elm-stuff'


" LanguageClient --------------------------------------------------------------
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'python': ['pyls'],
    \ }


" Lightline -------------------------------------------------------------------
" Don't show default mode label
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'readonly', 'filename', 'modified', 'paste' ] ]
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

" fiugitive get head Seems to slow down things when scrolling slow
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

nmap <leader>g :NERDTreeFind<CR>


" NERDTREE tabs --------------------------------------------------------------
" Map Ctrl+n to toggle (Using nerdtree tabs instead)
nmap <C-n> :NERDTreeTabsToggle<CR>

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
