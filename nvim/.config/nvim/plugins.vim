call plug#begin()
    Plug 'https://github.com/RRethy/vim-illuminate'
    Plug 'https://github.com/Shougo/denite.nvim'
    " NOTE: Disabled b/c it messes with coc.vim (causes error messages in echo
    " line to be displayed while in insert mode)
    " Plug 'https://github.com/Shougo/deoplete.nvim'
    Plug 'https://github.com/Shougo/echodoc.vim'
        " Display completion in echo area
        let g:echodoc_enable_at_startup=1
        let g:echodoc#type = 'floating'
    Plug 'https://github.com/airblade/vim-gitgutter'
    Plug 'https://github.com/andymass/vim-matchup'
    Plug 'https://github.com/ncm2/float-preview.nvim'
        set completeopt-=preview
        let g:float_preview#max_height=20
        let g:float_preview#max_width=20
    " NOTE: Disabled, using coc instead
    " Plug 'autozimu/LanguageClient-neovim', {
    "     \ 'branch': 'next',
    "     \ 'do': 'bash install.sh',
    "     \ }
    Plug 'https://github.com/christoomey/vim-tmux-navigator'
    Plug 'https://github.com/itchyny/lightline.vim'
    Plug 'https://github.com/jistr/vim-nerdtree-tabs'
    Plug 'https://github.com/junegunn/fzf.vim'
    Plug 'https://github.com/justinmk/vim-sneak'
    Plug 'https://github.com/kshenoy/vim-signature'
    Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
    Plug 'https://github.com/ntpeters/vim-better-whitespace'
    Plug 'https://github.com/scrooloose/nerdcommenter'
    Plug 'https://github.com/scrooloose/nerdtree'
    Plug 'https://github.com/simeji/winresizer'
    Plug 'https://github.com/thirtythreeforty/lessspace.vim'
    Plug 'https://github.com/tpope/vim-fugitive'
    Plug 'https://github.com/tpope/vim-repeat'
    Plug 'https://github.com/tpope/vim-sensible'
    Plug 'https://github.com/tpope/vim-surround'
    " Plug 'https://github.com/w0rp/ale'

    " Disabled --------------------------------------------------------------------
    " NOTE: Disabled until I figure out how to configure universal-ctags and
    " vim-gutentags to correctly ignore directories like node_modules, target
    " (rust), etc.
    " Plug 'https://github.com/ludovicchabant/vim-gutentags'

    " NOTE: Disabled until needed
    " Plug 'https://github.com/RRethy/vim-hexokinase'
    "     let g:Hexokinase_virtualText = '██████'
    " -----------------------------------------------------------------------------

    " Elm
    Plug 'https://github.com/francium/elm-vim', {'for': 'elm'}
        " Fork with some fixes
        " elm-vim relies on Elm Oracle, which doesn't support Elm 0.19, so disable
        " for now
        autocmd BufEnter *.elm execute 'call deoplete#disable()'
        autocmd BufLeave *.elm execute 'call deoplete#enable()'

    " HTML
    Plug 'https://github.com/mattn/emmet-vim', {'for': 'html'}

    " Typescript
    Plug 'https://github.com/leafgarland/typescript-vim', {'for': 'typescript'}
    Plug 'https://github.com/HerringtonDarkholme/yats.vim', {'for': 'typescript'}
    " NOTE: Disabled because it uses too much RAM
    " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    "     let g:nvim_typescript#default_mappings=1
    "     " TODO: Map :TS* commands to shortcuts only for *.ts files
    "     " TODO: Research and fix
    "     " autocmd! BufEnter *.ts noremap gh :TSDefPreview<CR>
    "     " autocmd! BufLeave *.ts nunmap gh

    " Rust
    Plug 'https://github.com/rust-lang/rust.vim', {'for': 'rust'}

    " Zig
    Plug 'https://github.com/ziglang/zig.vim', {'for': 'zig'}

    " {{{ Colorschemes
    Plug 'https://github.com/morhetz/gruvbox'
        let g:gruvbox_contrast_dark='hard'
        let g:gruvbox_contrast_light='hard'
    Plug 'https://github.com/lifepillar/vim-gruvbox8'
    Plug 'https://github.com/rakr/vim-one'
        let ayucolor="light" " light, mirage, dark
    Plug 'https://github.com/zaki/zazen'
    Plug 'https://github.com/davidosomething/vim-colors-meh'
    " }}}
call plug#end()

" {{{ COC -------------------------------------------------------------------------
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Trigger completion
imap <silent><expr> <c-l> coc#refresh()

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

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
" }}} -----------------------------------------------------------------------------

" {{{ ALE -------------------------------------------------------------------------
let g:ale_lint_delay = 1000
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

nmap <leader>aa :ALEDetail<CR>
" }}} -----------------------------------------------------------------------------

" {{{ Deoplete --------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
" }}} -----------------------------------------------------------------------------

" {{{ Emmet Vim -------------------------------------------------------------------
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" }}} -----------------------------------------------------------------------------

" {{{ FZF -------------------------------------------------------------------------
nmap <leader>; :Commands<CR>
nmap <leader>f :FZF<CR>
nmap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<space>
let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --exclude node_modules --exclude venv --exclude elm-stuff'
" }}} -----------------------------------------------------------------------------

" {{{ LanguageClient --------------------------------------------------------------
" let g:LanguageClient_serverCommands = {
"     \ 'rust': ['rustup', 'run', 'stable', 'rls'],
"     \ 'python': ['pyls'],
"     \ }
"
" let g:LanguageClient_rootMarkers = {
"     \ 'rust': ['Cargo.toml'],
"     \ 'typescript': ['tsconfig.json'],
"     \ }

" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" nnoremap <silent> ga :call LanguageClient#explainErrorAtPoint()<CR>
" nnoremap <silent> gc :call LanguageClient_contextMenu()<CR>
" }}} -----------------------------------------------------------------------------

" {{{ Lightline -------------------------------------------------------------------
" Don't show default mode label
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
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
" }}} -----------------------------------------------------------------------------

" {{{ NERDTreee -------------------------------------------------------------------
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
" }}} -----------------------------------------------------------------------------

" {{{ NERDTREE tabs ---------------------------------------------------------------
" Map Ctrl+n to toggle (Using nerdtree tabs instead)
nmap <C-n> :NERDTreeTabsToggle<CR>

" Open on console startup
let g:nerdtree_tabs_open_on_console_startup = 0
" }}} -----------------------------------------------------------------------------

" {{{ NERDCommenter ---------------------------------------------------------------
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

nmap <C-_>   <Plug>NERDCommenterToggle j
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv <ESC>
" }}} -----------------------------------------------------------------------------

" {{{ Vim-Tmux-Navigator ----------------------------------------------------------
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
nnoremap <silent> <C-/> :TmuxNavigatePrevious<cr>
" }}} -----------------------------------------------------------------------------

" {{{ winresizer ------------------------------------------------------------------
let g:winresizer_start_key = 'foobar'
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
nmap <Leader>e :WinResizerStartResize<CR>
" }}} -----------------------------------------------------------------------------

" vim: set foldmethod=marker:
