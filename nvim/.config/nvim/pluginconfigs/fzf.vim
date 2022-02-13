Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .cache --exclude .git --exclude node_modules --exclude venv --exclude .venv --exclude __pycache__ --exclude .spago'
" Prompt at top of screen
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Disable preview window
let g:fzf_preview_window=''

" Override Rg command and add extra custom flags to `rg`
" - `--hidden`
" - `--invert-match`
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden ".shellescape(<q-args>), 1, <bang>0)
command! -bang -nargs=* Rgi call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --hidden --invert-match ".shellescape(<q-args>), 1, <bang>0)

nmap <leader>ff :FZF<CR>
nmap <leader>fd :FZF %:p:h<CR>
nmap <leader>fc :Commands<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fh :History<CR>
nmap <leader>fv :History:<CR>
nmap <leader>fm :Marks<CR>
nmap <leader>fr :Rg<space>
" Search selection using Rg
vmap <leader>fr y:Rg<space><c-r>"<CR>
" TODO Doesn't work
vmap <leader>f* y/<c-r>"<CR>``

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" Override fzf's s:default_action to add quickfix option
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Using floating windows of Neovim to start fzf
if has('nvim')
  function! FloatingFZF(width, height, border_highlight)
    function! s:create_float(hl, opts)
      let buf = nvim_create_buf(v:false, v:true)
      let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
      let win = nvim_open_win(buf, v:true, opts)
      call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
      call setwinvar(win, '&colorcolumn', '')
      return buf
    endfunction

    " Size and position
    let width = float2nr(&columns * a:width)
    let height = float2nr(&lines * a:height)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)

    " Border
    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let border = [top] + repeat([mid], height - 2) + [bot]

    " Draw frame
    let s:frame = s:create_float(a:border_highlight, {'row': row, 'col': col, 'width': width, 'height': height})
    call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

    " Draw viewport
    call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
    autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF(0.9, 0.9, "Comment")' }
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

" Close multiple buffers
" Usage: run `:BD`, then use <tab>/<shift-tab> to select buffers, press enter
" to close selected
"
" NOTE this won't have nice formatting. To get that you would have to create a new
" format_buffers function and chain that,
"     function! s:format_buffers(buf)
"       " a:buf is the arg
"       ...
"     endfunction
"
"     'source:' map(s:list_buffers(), 's:format_buffer(v:val)')
" As long as the line's structure isn't changed, the delete_buffers can still
" parse out the buf number from the line with its current implementation of
" splitting the line and taking the first item
command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))
