Plug 'https://github.com/junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .cache --exclude .git --exclude node_modules --exclude venv'

" Override Rg command and add extra custom flags to `rg`
" - `--hidden`
" - `--invert-match`
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden ".shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Rgi call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --invert-match ".shellescape(<q-args>), 1, <bang>0)

nmap <leader>ff :FZF<CR>
nmap <leader>fc :Commands<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fr :Rg<space>
" Search selection using Rg
vmap <leader>fr y:Rg<space><c-r>"<CR>
vmap <leader>f* y/<c-r>"<CR>``

function! FZFFileRelativeSearch()
    let l:prevcwd = getcwd()
    echo l:prevPwd
    " cd %:p:h
    " FZF
    " cd l:prevPwd
endfunction
nmap <leader>fF :call FZFFileRelativeSearch()<CR>
