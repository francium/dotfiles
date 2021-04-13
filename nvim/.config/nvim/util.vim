function! EnableHyphenedKeywords()
    " Include hyphenated words in completion
    setlocal iskeyword+=-
    " TODO What is this doing and why is it needed?
    setlocal iskeyword-=:
endfunction
