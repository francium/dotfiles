Plug 'https://github.com/itchyny/lightline.vim'

" Don't show default mode label
set noshowmode

let g:lightline = {
\   'colorscheme': 'deus',
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
\       'fugitive': 'LightlineFugitive',
\       'readonly': 'LightlineReadonly',
\       'modified': 'LightlineModified',
\       'langclient': 'LightlineLangClient',
\       'cocStatus': 'coc#status',
\   },
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '│', 'right': '│' },
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
\}

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

" fiugitive get head Seems to slow down things when scrolling slow
function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' ⎇  '.branch : ''
  endif
  return ''
endfunction
