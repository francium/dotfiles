source ~/.config/nvim/colors.vim


function! LoadPlugins()
    call plug#begin()

    call g:LoadColors()

    source ~/.config/nvim/pluginconfigs/ale.vim
    source ~/.config/nvim/pluginconfigs/coc.vim
    source ~/.config/nvim/pluginconfigs/deoplete.vim
    source ~/.config/nvim/pluginconfigs/emmet.vim
    source ~/.config/nvim/pluginconfigs/fzf.vim
    source ~/.config/nvim/pluginconfigs/languageclient-neovim.vim
    source ~/.config/nvim/pluginconfigs/lightline.vim
    source ~/.config/nvim/pluginconfigs/nerdtree.vim
    source ~/.config/nvim/pluginconfigs/nerdcommenter.vim
    source ~/.config/nvim/pluginconfigs/vim-tmux-navigator.vim
    source ~/.config/nvim/pluginconfigs/winresizer.vim
    source ~/.config/nvim/pluginconfigs/vim-devicons.vim
    source ~/.config/nvim/pluginconfigs/vim-http.vim

    Plug 'https://github.com/google/vim-maktaba'
    Plug 'https://github.com/google/vim-codefmt'
        augroup autoformat_settings
            autocmd FileType bzl AutoFormatBuffer buildifier
        augroup END

    Plug 'https://github.com/RRethy/vim-illuminate'
    Plug 'https://github.com/Shougo/denite.nvim'
    Plug 'https://github.com/airblade/vim-gitgutter'
        let g:gitgutter_map_keys = 0 " Disable default key mappings
        nmap <leader>hn <Plug>(GitGutterNextHunk)
        nmap <leader>hp <Plug>(GitGutterPrevHunk)
        nmap <leader>hs <Plug>(GitGutterPreviewHunk)
        nmap <leader>hS <Plug>(GitGutterStageHunk)
        nmap <leader>hX <Plug>(GitGutterUndoHunk)
    Plug 'https://github.com/andymass/vim-matchup'
    Plug 'https://github.com/editorconfig/editorconfig-vim'
    if v:version > 800 || has('nvim-0.4.0')
        Plug 'https://github.com/glacambre/firenvim'
    endif
    Plug 'https://github.com/justinmk/vim-sneak'
    Plug 'https://github.com/kshenoy/vim-signature'
    Plug 'https://github.com/ntpeters/vim-better-whitespace'
        let g:better_whitespace_guicolor='#330000'
    Plug 'https://github.com/thirtythreeforty/lessspace.vim'
    Plug 'https://github.com/tpope/vim-fugitive'
        nmap <leader>gs :vertical Git<cr>
    Plug 'https://github.com/tpope/vim-repeat'
    Plug 'https://github.com/tpope/vim-sensible'
    Plug 'https://github.com/tpope/vim-surround'

    Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript'] }
        let g:prettier#autoformat = 1
        nmap <leader>ap :Prettier<CR>

    " ANTLR 3/4 ----------------------------------------------------------------
    Plug 'https://github.com/dylon/vim-antlr', {'for': ['antlr']}

    " HTML ---------------------------------------------------------------------
    Plug 'https://github.com/othree/html5.vim', {'for': ['html', 'svg']}

    " C/C++ --------------------------------------------------------------------
    Plug 'https://github.com/bfrg/vim-cpp-modern'

    " Go ---------------------------------------------------------------------
    if v:version > 800 || has('nvim-0.4.0')
        Plug 'https://github.com/fatih/vim-go'
    endif

    " GLSL --------------------------------------------------------------------
    Plug 'https://github.com/tikhomirov/vim-glsl'

    " Haskell ------------------------------------------------------------------
    Plug 'https://github.com/neovimhaskell/haskell-vim', {'for': 'haskell'}

    " Python -------------------------------------------------------------------
    Plug 'https://github.com/Vimjas/vim-python-pep8-indent', {'for': 'python'}
    " Syntax
    " Plug 'https://github.com/numirias/semshi', {'for': 'python'}

    " Typescript ---------------------------------------------------------------
    Plug 'https://github.com/HerringtonDarkholme/yats.vim', {'for': 'typescript'}
    Plug 'https://github.com/Quramy/vim-js-pretty-template', {'for': ['typescript']}
    " autocmd! FileType typescript JsPreTmpl html
    " autocmd! FileType typescript syn clear foldBraces

    " Rust ---------------------------------------------------------------------
    Plug 'https://github.com/rust-lang/rust.vim', {'for': 'rust'}

    " Zig ----------------------------------------------------------------------
    Plug 'https://github.com/ziglang/zig.vim', {'for': 'zig'}
        let g:zig_fmt_autosave = 0

    " Disabled -----------------------------------------------------------------
    " Plug 'https://github.com/ncm2/float-preview.nvim'
    " Plug 'https://github.com/ludovicchabant/vim-gutentags'
    " appears that ctags can't handle long names, causing formatting errors
    " Plug 'https://github.com/liuchengxu/vista.vim'
    " let g:vista_executive_for = {
    " \ 'typescript': 'lcn',
    " \ }
    " nmap <C-m> :Vista!!<CR>

    call plug#end()
endfunction

call LoadPlugins()
call PostLoadColors()
