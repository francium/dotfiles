function! EnableHyphenedKeywords()
    " Include hyphenated words in completion
    setlocal iskeyword+=-
    setlocal iskeyword-=:
endfunction
