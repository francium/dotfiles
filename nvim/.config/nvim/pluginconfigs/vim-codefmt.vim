Plug 'https://github.com/google/vim-maktaba'
Plug 'https://github.com/google/vim-codefmt'

augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
augroup END
