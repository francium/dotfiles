" Reload config
nnoremap <F2> :so $MYVIMRC<CR>
nmap <leader><f2> :tabedit $MYVIMRC<CR>


" Basic -----------------------------------------------------------------------

" jj -> esc
imap jj <ESC>

" write
nnoremap <leader>s :w<CR>
nnoremap <leader>wa :wall<CR>

" Clear search highlighting
nmap <silent> <esc> :nohlsearch<Bar>:echo<CR>

" Search current word under cursor without jumping
" Source: https://stackoverflow.com/a/49944815
nnoremap <silent> * :let @/= '\<' . expand('<cword>') . '\>' <bar> set hls <cr>

" nmap * viw"zy:let @/=@z<CR>n``
" Search selection
vmap * y/<c-r>"<CR>``


" clipboard shortcuts (copy, paste)
map <leader>y "+y:echo "Copied to clipboard"<CR>
imap <leader>p <C-R>+":echo "Pasted from clipboard"<CR>
map <leader>p "+p:echo "Copied to clipboard"<CR>

" Sort words
" DrAl, spatz from StackOverflow
vnoremap <F6> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" Fold
nnoremap <space><space> za

" Editing and Movement ---------------------------------------------------------

" Replace the word under the cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" Replace selection selection
vnoremap <leader>* y:%s/\<<c-r><c-w>\>//g<left><left>

" Horizontal panning (like C-e/C-y)
nmap ( zh
nmap ) zl

" Insert mode movement
inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Command mode movement
cnoremap <C-h> <Left>
" cnoremap <C-j> <Down>
" cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" Quotes and brackets
inoremap ``` ```
inoremap ``i ``<Esc>i
inoremap ''i ''<Esc>i
inoremap ""i ""<Esc>i
inoremap <<i <><Esc>i
inoremap ((i ()<Esc>i
inoremap ((o (<CR>)<Esc>ko
inoremap [[i []<Esc>i
inoremap [[o [<CR>]<Esc>ko
inoremap {{i {}<Esc>i
inoremap {{o {<CR>}<Esc>ko
inoremap {{{i {{}}<Esc>hi
inoremap {{{o {{<CR>}}<Esc>ko

" "move lines around
" nnoremap <leader>k :m-2<cr>==
" nnoremap <leader>j :m+<cr>==
" xnoremap <leader>k :m-2<cr>gv=gv
" xnoremap <leader>j :m'>+<cr>gv=gv

" Next/previous quickfix item
nmap <leader>cn :cnext<CR>
nmap <leader>cp :cprev<CR>

" TERMINAL ---------------------------------------------------------------------

" By defualt, :terminal replaces current buffer, we can alias new command for
" something more flexible. These will expand upon typing the alias, the
" command to run needs to be specified after the `://`
"
" These are disabled because they auto expand and can be annoying when they
" expand accidentally when not actually wanted
"
" ca tt :tabedit term://
" ca ts :split term://
" ca tv :vsplit term:/

noremap <leader>tt :tabedit term://bash<CR>
noremap <leader>ts :split term://bash<CR>
noremap <leader>tv :vsplit term://bash<CR>

" Terminal split Movement
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Terminal escape (only enabled on plain terminals and disable when leaving it to avoid
" causing fzf to go into normal mode instead of closing)
autocmd BufEnter term://.*:bash silent! tnoremap <ESC> <C-\><C-n>
autocmd BufLeave term://.*:bash silent! tunmap <ESC>

" SPLITTING --------------------------------------------------------------------

" Disabled because Tmux Vim Navigator mappings are used to handle movement
" nmap <C-J> <C-W><C-J>
" nmap <C-K> <C-W><C-K>
" nmap <C-L> <C-W><C-L>
" nmap <C-H> <C-W><C-H>

" Close other split
nnoremap <C-x> <C-W>w:q<CR>

" Quickly close focused split or window
nnoremap <leader>q :q

nmap <leader>b :split<CR>
nmap <leader>v :vsplit <CR>


" TABS -------------------------------------------------------------------------

" Tab split
" TODO: Might be gitten overridden by something
nnoremap <leader>T :tab split<CR>

" TODO: Close split and reopen in a new tab
" copy current buffer number then `:tab b{buffer num}`

" Tab switching
au TabLeave * let g:lasttab = tabpagenr()
nnoremap H gT
nnoremap L gt
" Last tab
nnoremap <A-0> :exe "tabn ".g:lasttab<cr>
nnoremap <A-1> :tabn1<CR>
nnoremap <A-2> :tabn2<CR>
nnoremap <A-3> :tabn3<CR>
nnoremap <A-4> :tabn4<CR>
nnoremap <A-5> :tabn5<CR>
nnoremap <A-6> :tabn6<CR>
nnoremap <A-7> :tabn7<CR>
nnoremap <A-8> :tabn8<CR>
nnoremap <A-9> :tabn8<CR>

" Tab reordering
nmap <leader>,, :tabm -1<CR>
nmap <leader>.. :tabm +1<CR>


" JSON formatting
com! FormatJSON :%!python -m json.tool
com! -range FormatJSONRange <line1>,<line2>:!python -m json.tool

" New file in same direct at current file
function! NewHereFn(filename)
    let path = expand('%:p:h') . "/" . a:filename
    execute "edit " . path
    write
    if exists(':NERDTreeRefreshRoot')
        NERDTreeRefreshRoot
    endif
endfunction
com! -nargs=1 NewHere call NewHereFn(<f-args>)


" Misc -------------------------------------------------------------------------

" Toggle darkness
function! ToggleBackgroundDarkness()
    if &background ==# "light"
        set background=dark
        colorscheme one
        call ConfigureVimOneColors()
    else
        set background=light
        colorscheme one
        call ConfigureVimOneColors()
    endif
endfunction
map <F4> :call ToggleBackgroundDarkness()<CR>

" Sync syntax highlighting
nmap <leader><f12> :syntax sync fromstart<cr>
autocmd BufEnter * syntax sync fromstart

" Copy paths
com! CopyRelDirPath :let @+=expand("%:h")
com! CopyFilePath :let @+=expand("%")
