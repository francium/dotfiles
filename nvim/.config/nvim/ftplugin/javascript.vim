setlocal ts=2 sw=2 foldmethod=syntax foldlevel=99

if !$coc
    set suffixesadd=.js,.ts,.jsx
endif

" Snips -----------------------------------------------------------------------
inoremap xxfn ()<space>=><esc>3hi
inoremap xxfunc function<space>()<space>{}<esc>_wi

" Karma testing
inoremap xxit it('',<space>()<space>=><space>{<cr>});<esc><esc>k_f'a
inoremap xxdesc describe('',<space>()<space>=><space>{<cr>});<esc>k_f'a

inoremap xxgs set<space><c-r>"(val)<space>{<cr>this._<c-r>"<space>=<space>val;<cr>}<cr>
  \get<space><c-r>"()<space>{<cr>return<space>this._<c-r>";<cr>}<cr>
  \_<c-r>";
