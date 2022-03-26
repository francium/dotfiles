setlocal ts=2 sw=2 foldmethod=syntax foldlevel=99

setlocal iskeyword+=$

set suffixesadd=.js,.ts,.jsx

" Snips -----------------------------------------------------------------------
" if
inoremap xxif if ()<space>{<cr>}<esc>k<esc>f(a
" if/else
inoremap xxei if ()<space>{<cr>} else if () {<cr>} else {<cr>}<esc>3k<esc>f(a
" if/else if/else
inoremap xxel if ()<space>{<cr>} else {<cr>}<esc>2k<esc>f(a

inoremap xxfn ()<space>=><esc>3hi
inoremap xxfunc function<space>()<space>{}<esc>_wi

" Karma testing
inoremap xxit it('',<space>()<space>=><space>{<cr>});<esc><esc>k_f'a
inoremap xxdesc describe('',<space>()<space>=><space>{<cr>});<esc>k_f'a

inoremap xxgs set<space><c-r>"(val)<space>{<cr>this._<c-r>"<space>=<space>val;<cr>}<cr>
  \get<space><c-r>"()<space>{<cr>return<space>this._<c-r>";<cr>}<cr>
  \_<c-r>";
