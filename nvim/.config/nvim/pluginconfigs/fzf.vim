Plug 'https://github.com/junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .cache --exclude .git --exclude node_modules --exclude venv'

nmap <leader>ff :FZF<CR>
nmap <leader>fc :Commands<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fr :Rg<space>
