function! __Install_Headlines()
    " Plug 'https://github.com/lukas-reineke/headlines.nvim'
        " https://github.com/lukas-reineke/headlines.nvim/pull/54
        " Plug 'https://github.com/tomtomjhj/headlines.nvim', { 'branch': 'for-end' }
        "
        Plug 'https://github.com/lukas-reineke/headlines.nvim', { 'branch': 'fix-markdown-quotes' }
endfunction

function! __Configure_Headlines()
    highlight link Quote markdownBlockquote
    if $d
        highlight Headline1 guibg=#3f3f3f
        highlight Headline2 guibg=#3b3b3b
        highlight Headline3 guibg=#373737
        highlight Headline4 guibg=#323232
        highlight Headline5 guibg=#2f2f2f
        highlight Headline6 guibg=#2a2a2a

        highlight CodeBlock guibg=#2f2f2f
    else
        highlight Headline1 guibg=#e4e4e4
        highlight Headline2 guibg=#eaeaea
        highlight Headline3 guibg=#efefef
        highlight Headline4 guibg=#f4f4f4
        highlight Headline5 guibg=#f8f8f8
        highlight Headline6 guibg=#fbfbfb

        highlight CodeBlock guibg=#efefef
    endif

lua << EOF
    require("headlines").setup {
        markdown = {
            query = vim.treesitter.query.parse(
                "markdown",
                [[
                    (atx_heading [
                        (atx_h1_marker)
                        (atx_h2_marker)
                        (atx_h3_marker)
                        (atx_h4_marker)
                        (atx_h5_marker)
                        (atx_h6_marker)
                    ] @headline)

                    (thematic_break) @dash

                    (fenced_code_block) @codeblock

                    (block_quote_marker) @quote
                    (block_quote (paragraph (inline (block_continuation) @quote)))
                ]]
            ),
            headline_highlights = {
                "Headline1",
                "Headline2",
                "Headline3",
                "Headline4",
                "Headline5",
                "Headline6",
            },
            codeblock_highlight = "CodeBlock",
            dash_highlight = "Dash",
            dash_string = "-",
            quote_string = ">",
            fat_headlines = false,
        }
    }
EOF
endfunction
