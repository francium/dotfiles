" Reload config
nnoremap <F8> :so $MYVIMRC<CR>

" TERMINAL ---------------------------------------------------------------------
" More sensible terminal opening commands
ca term :split term://bash
ca vterm :vsplit term://bash

noremap <leader>tt :split term://bash<CR>
noremap <leader>tv :vsplit term://bash<CR>

" Terminal splitting
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Terminal escape (only enabled on plain terminals and disable when leaving it to avoid
" causing fzf to go into normal mode instead of closing)
autocmd BufEnter term://.*:bash tnoremap <ESC> <C-\><C-n>
autocmd BufLeave term://.*:bash tunmap <ESC>

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

" Scrolling other split
nmap <silent> <a-j> <C-W>w<C-E><C-W>w
nmap <silent> <a-k> <C-W>w<C-Y><C-W>w

" TABS -------------------------------------------------------------------------

" Tab switching
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <C-S-T> :exe "tabn ".g:lasttab<cr>
nnoremap <S-H> gT
nnoremap <S-L> gt
nnoremap <A-1> :tabn1<CR>
nnoremap <A-2> :tabn2<CR>
nnoremap <A-3> :tabn3<CR>
nnoremap <A-4> :tabn4<CR>
nnoremap <A-5> :tabn5<CR>
nnoremap <A-6> :tabn6<CR>
nnoremap <A-7> :tabn7<CR>
nnoremap <A-8> :tabn8<CR>
nnoremap <A-9> :tabn8<CR>
nnoremap <A-0> :tabn10<CR>

" jj -> esc
imap jj <ESC>

" write
nnoremap <leader>s :w<CR>

" Search highlights clear using Space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Search current word under cursor without jumping
nnoremap * *``

" clipboard shortcuts (copy, paste)
map <leader>y "+y:echo "Copied to clipboard"<CR>
imap <leader>p <C-R>+":echo "Pasted from clipboard"<CR>
map <leader>p "+p:echo "Copied to clipboard"<CR>

" Sort words
" DrAl, spatz from StackOverflow
vnoremap <F6> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" JSON Formatting
nmap <leader>jf :%!python -m json.tool<CR>

" Toggle darkness
function! ToggleBackgroundDarkness()
    if &background ==# "light"
        set background=dark
        colorscheme gruvbox
    else
        set background=light
        colorscheme one
    endif

    highlight ExtraWhitespace ctermbg=brown
    highlight ExtraWhitespace guibg=orange
endfunction
map <F4> :call ToggleBackgroundDarkness()<CR>

" Replace the word under the cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

" "move lines around
" nnoremap <leader>k :m-2<cr>==
" nnoremap <leader>j :m+<cr>==
" xnoremap <leader>k :m-2<cr>gv=gv
" xnoremap <leader>j :m'>+<cr>gv=gv
