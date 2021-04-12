Plug 'https://github.com/nicwest/vim-http'

let g:vim_http_tempbuffer = 1
let g:vim_http_additional_curl_args = "-L"
autocmd FileType http nmap <buffer> <leader>hi :call append(0, "GET example.com HTTP/1.1")<CR>
autocmd FileType http nmap <buffer> <leader>hh :Http<CR>
autocmd FileType http nmap <buffer> <leader>hj :call http#set_header('Content-Type', 'application/json')<CR>
autocmd FileType http nmap <buffer> <leader>ha :HttpAuth<CR>
