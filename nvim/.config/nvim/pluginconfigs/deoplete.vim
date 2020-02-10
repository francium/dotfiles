" function! PluginPostInitDeoplete()
"   echo "33333333333333333333\n\n"
"
"   UpdateRemotePlugins
"
"   let g:deoplete#enable_at_startup = 1
"   call deoplete#enable()
"   call deoplete#custom#option('auto_complete_delay', 250)
" endfunction
"
" if !exists('$coc') || !$coc
"   " NOTE: Disabled b/c it causes error messages in insert mode when coc is
"   " enabled
"   Plug 'https://github.com/Shougo/deoplete.nvim', {
"    \ }
"     " \ 'do': ':call PluginPostInitDeoplete()'
"     " \ 'do': ':UpdateRemotePlugins'
"   autocmd! User deoplete.nvim echom "2222222222222222\n\n"
"
"   echo "11111111111111111\n\n"
" endif
