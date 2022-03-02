source ~/.config/nvim/colors.vim

source ~/.config/nvim/pluginconfigs/virt-column.vim

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
    source ~/.config/nvim/pluginconfigs/vim-gitgutter.vim
    source ~/.config/nvim/pluginconfigs/vim-fugitive.vim
    source ~/.config/nvim/pluginconfigs/vim-codefmt.vim

    call __Install_VirtColumn()

    Plug 'https://github.com/hkupty/iron.nvim'
    Plug 'https://github.com/RRethy/vim-illuminate'
    Plug 'https://github.com/Shougo/denite.nvim'
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
    Plug 'https://github.com/tpope/vim-repeat'
    Plug 'https://github.com/tpope/vim-sensible'
    Plug 'https://github.com/tpope/vim-surround'
    Plug 'https://github.com/tpope/vim-abolish'

    " ANTLR 3/4 ----------------------------------------------------------------
    Plug 'https://github.com/dylon/vim-antlr', {'for': ['antlr']}

    " C/C++ --------------------------------------------------------------------
    Plug 'https://github.com/bfrg/vim-cpp-modern'

    " Dhall
    Plug 'https://github.com/vmchale/dhall-vim'

    " Go ---------------------------------------------------------------------
    if v:version > 800 || has('nvim-0.4.0')
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
            let g:go_doc_popup_window = 1
    endif

    " GLSL --------------------------------------------------------------------
    Plug 'https://github.com/tikhomirov/vim-glsl'

    " Haskell ------------------------------------------------------------------
    Plug 'https://github.com/neovimhaskell/haskell-vim', {'for': 'haskell'}

    " Purescript
    Plug 'https://github.com/purescript-contrib/purescript-vim'

    " Python -------------------------------------------------------------------
    Plug 'https://github.com/Vimjas/vim-python-pep8-indent', {'for': 'python'}

    " Rust ---------------------------------------------------------------------
    Plug 'https://github.com/rust-lang/rust.vim', {'for': 'rust'}

    " Zig ----------------------------------------------------------------------
    Plug 'https://github.com/ziglang/zig.vim', {'for': 'zig'}
        let g:zig_fmt_autosave = 0

    " Web ----------------------------------------------------------------------
    Plug 'https://github.com/evanleck/vim-svelte'
    Plug 'https://github.com/MaxMEllon/vim-jsx-pretty'

    " HTML ---------------------------------------------------------------------
    Plug 'https://github.com/othree/html5.vim', {'for': ['html', 'svg']}

    " Typescript ---------------------------------------------------------------
    Plug 'https://github.com/HerringtonDarkholme/yats.vim', {'for': 'typescript'}
    Plug 'https://github.com/Quramy/vim-js-pretty-template', {'for': ['typescript']}

    call plug#end()
endfunction

function! PostLoadPlugins()
    call PostLoadColors()

    call __Configure_VirtColumn()
endfunction

call LoadPlugins()
call PostLoadPlugins()
