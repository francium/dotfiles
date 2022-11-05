source ~/.config/nvim/colors.vim

source ~/.config/nvim/pluginconfigs/virt-column.vim
source ~/.config/nvim/pluginconfigs/indent-blankline.vim

function! LoadPlugins()
    call plug#begin()

    call g:LoadColors()

    Plug 'https://github.com/antoinemadec/FixCursorHold.nvim'
        " - Fixes neovim CursorHold and CursorHoldI autocmd events performance
        "   bug (https://github.com/neovim/neovim/issues/12587)
        " - Decouples updatetime from CursorHold and CursorHoldI (works for
        "   Vim and Neovim)

    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    source ~/.config/nvim/pluginconfigs/coc.vim
    source ~/.config/nvim/pluginconfigs/deoplete.vim
    source ~/.config/nvim/pluginconfigs/emmet.vim
    source ~/.config/nvim/pluginconfigs/fzf.vim
    source ~/.config/nvim/pluginconfigs/languageclient-neovim.vim
    source ~/.config/nvim/pluginconfigs/lightline.vim
    source ~/.config/nvim/pluginconfigs/nerdcommenter.vim
    source ~/.config/nvim/pluginconfigs/nvim-tree.vim
    source ~/.config/nvim/pluginconfigs/vim-tmux-navigator.vim
    source ~/.config/nvim/pluginconfigs/winresizer.vim
    " source ~/.config/nvim/pluginconfigs/vim-devicons.vim
      " Not using right now
    source ~/.config/nvim/pluginconfigs/vim-http.vim

    call __Install_VirtColumn()
    call __Install_IndentBlankline()

    " Plug 'https://github.com/hkupty/iron.nvim'
        " Interactive REPLs
        " TODO: Conflicts with c mappings, need to setup custom maps to avoid
        " causing delays when using c mappings
    " Plug 'https://github.com/RRethy/vim-illuminate'
    "     " Automatically highlighting other uses of the word under the cursor
    "     let g:Illuminate_ftblacklist = ['nerdtree', 'qf']
    "     NOTE: Disabled because they changed to lua and this needs to be
    "     configured and this plugin wasn't used too much
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
    Plug 'https://github.com/tpope/vim-unimpaired'
        " Various useful `[`/`]` mappings
    Plug 'https://github.com/AndrewRadev/bufferize.vim'
        " Allows redirection of a :command into a buffer
    Plug 'https://github.com/luochen1990/rainbow' ", {'for': ['scheme', 'lisp', 'clojure']}
        let g:rainbow_active = 1
        let g:rainbow_conf = {
        \    'operators': '_,_',
        \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
        \    'separately': {
        \        '*': 0,
        \        'lisp': {},
        \        'scheme': {},
        \    }
        \}
    Plug 'https://github.com/SirVer/ultisnips'
        let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips/"
        let g:UltiSnipsExpandTrigger="<leader>ss"
        let g:UltiSnipsListSnippets="<leader>sf"
        let g:UltiSnipsJumpForwardTrigger="<leader>sn"
        let g:UltiSnipsJumpBackwardTrigge="<leader>sp"

    " Git ----------------------------------------------------------------------
    source ~/.config/nvim/pluginconfigs/vim-signify.vim
    source ~/.config/nvim/pluginconfigs/vim-fugitive.vim
    Plug 'https://github.com/rhysd/git-messenger.vim'
        " Popup git blame for a line
    Plug 'https://github.com/rhysd/committia.vim'
        " More pleasant git commit editing
    Plug 'https://github.com/rhysd/conflict-marker.vim'
        " Git conflict highlighting and conflict resolution
        let g:conflict_marker_enable_mappings = 0
            " Has conflicting mapping with vim-unimpaired, `[x`
        nnoremap [gc :ConflictMarkerPrevHunk<CR>
        nnoremap ]gc :ConflictMarkerNextHunk<CR>
    Plug 'https://github.com/masukomi/vim-markdown-folding'
        let g:markdown_fold_override_foldtext = 0
        " autocmd FileType markdown set foldexpr=NestedMarkdownFolds()

    " Markdown
    Plug 'https://github.com/preservim/vim-markdown'
        let g:vim_markdown_fenced_languages = [
        \    'c++=cpp',
        \    'viml=vim',
        \    'bash=sh',
        \    'ini=dosini',
        \    'xsh=python'
        \]
        g:vim_markdown_no_default_key_mappings = 1
        " let g:vim_markdown_conceal = 0
        " let g:tex_conceal = ""
        let g:vim_markdown_math = 1
        let g:vim_markdown_auto_insert_bullets = 0
        let g:vim_markdown_new_list_item_indent = 0
        let g:vim_markdown_strikethrough = 1
        let g:vim_markdown_math = 0
            " Can't use `$` in markdown with latex math enabled

    " Multi-language
    " NOTE: Checkout https://github.com/sheerun/vim-polyglot

    " ANTLR 3/4 ----------------------------------------------------------------
    " Plug 'https://github.com/dylon/vim-antlr', {'for': ['antlr']}

    " Bazel --------------------------------------------------------------------
    " source ~/.config/nvim/pluginconfigs/vim-codefmt.vim

    " C/C++ --------------------------------------------------------------------
    Plug 'https://github.com/bfrg/vim-cpp-modern'

    " Dhall
    " Plug 'https://github.com/vmchale/dhall-vim'

    " Go ---------------------------------------------------------------------
    if v:version > 800 || has('nvim-0.4.0')
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
            let g:go_doc_popup_window = 1
    endif

    " GLSL --------------------------------------------------------------------
    Plug 'https://github.com/tikhomirov/vim-glsl'

    " Haskell ------------------------------------------------------------------
    Plug 'https://github.com/neovimhaskell/haskell-vim', {'for': 'haskell'}

    " Just
    Plug 'https://github.com/NoahTheDuke/vim-just'

     " Lisp ---------------------------------------------------------------------
    Plug 'https://github.com/bakpakin/fennel.vim'
    Plug 'https://github.com/eraserhd/parinfer-rust', {
        \'for': ['scheme'],
        \'do': 'cargo build --release',
        \}
    Plug 'https://github.com/jpalardy/vim-slime'
        let g:slime_target = "tmux"
        let g:slime_paste_file = tempname()
    Plug 'https://github.com/Olical/conjure'
        com!ConjureGuileRepl :ConjureConnect .guile-repl.socket
        let g:conjure#filetype#scheme = "conjure.client.guile.socket"
            " Will be using Guile instead of MIT Scheme
        let g:conjure#client#guile#socket#pipename = ".guile-repl.socket"
            " If a REPL is already started, this will attempt to connect to it.
            " `.guile-repl.socket` is the default socket file name.
            " See https://github.com/Olical/conjure/wiki/Quick-start:-Guile-(socket)
        augroup ConjureRemoveSponsor
            autocmd BufWinEnter conjure-log-* silent s/; Sponsored by @.*//e
        augroup END

    " Nim
    Plug 'https://github.com/zah/nim.vim'

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

function! PostColorChangePlugins()
    " Rainbow
    if $d
        let g:rainbow_conf.guifgs = ['#ffffff', '#ff851b', '#7fdbff', '#ff4a36']
    else
        let g:rainbow_conf.guifgs = ['#0074d9', '#ff4136', '#f012b3', '#2ecc40', '#ff851b']
    endif
    " When loading, we may still be inside the Plug block, so plugin may
    " not be loaded yet
    try
        RainbowToggle
        RainbowToggle
    catch
    endtry
endfunction

function! PostLoadPlugins()
    call PostLoadColors()

    call __Configure_VirtColumn()
    call __Configure_IndentBlankline()
    call __Configure_NvimTree()
endfunction

call LoadPlugins()
call PostLoadPlugins()
call PostColorChangePlugins()
