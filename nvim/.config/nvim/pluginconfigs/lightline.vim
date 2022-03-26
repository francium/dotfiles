Plug 'https://github.com/itchyny/lightline.vim'

" Don't show default mode label
set noshowmode

let g:lightline = {
\   'active': {
\       'left': [
\           [ 'mode' ],
\           [
\             'readonly',
\             'filename',
\             'modified',
\             'paste',
\             'langclient',
\             'cocStatus',
\           ]
\       ]
\   },
\   'component_function': {
\       'filename': 'LightlineFilepath',
\       'readonly': 'LightlineReadonly',
\       'modified': 'LightlineModified',
\       'langclient': 'LightlineLangClient',
\       'cocStatus': 'coc#status',
\   },
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '', 'right': '' },
\   'mode_map': {
\       'n' : 'N',
\       'i' : 'I',
\       'R' : 'R',
\       'v' : 'V',
\       'V' : 'VL',
\       "\<C-v>": 'VB',
\       'c' : 'C',
\       's' : 'S',
\       'S' : 'SL',
\       "\<C-s>": 'SB',
\       't': 'T',
\   },
\   'tabline': {
\       'left': [ [ 'tabs' ] ],
\       'right': [ [ ] ]
\   },
\   'tab_component_function': {
\     'filename': 'LightlineTabFilepath'
\   },
\}

function! LightlineFilepath()
    return &ft ==# 'vimfiler' ? vimfiler#get_status_string() :
            \  &ft ==# 'unite' ? unite#get_status_string() :
            \ expand('%:f') !=# '' ? expand('%:f') : '[No Name]'
endfunction

" Slightly modified original, returns pwd relative file path with `expand(...:f)`
" See https://github.com/itchyny/lightline.vim/blob/master/autoload/lightline/tab.vim#L11
function! LightlineTabFilepath(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = expand('#'.buflist[winnr - 1].':f')
  return _ !=# '' ? _ : '[No Name]'
endfunction

function! LightlineLangClient()
  if $langclient
    return "<LC>"
  elseif $coc
    return "<COC>"
  else
    return ""
  endif
endfunction

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return 'RO'
  else
    return ""
  endif
endfunction
