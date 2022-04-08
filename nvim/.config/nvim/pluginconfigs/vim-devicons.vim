" Only enable if environment variable set
if !$VIM_PLUGIN_vim_devicons

    " Otherwise, enable lazy loading to ensure it does get installed
    Plug 'https://github.com/ryanoasis/vim-devicons', {'for': []}
else
    Plug 'https://github.com/ryanoasis/vim-devicons'
endif
