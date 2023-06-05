function! __Install_Headlines()
    " Plug 'https://github.com/lukas-reineke/headlines.nvim'
        " https://github.com/lukas-reineke/headlines.nvim/pull/54
        Plug 'https://github.com/tomtomjhj/headlines.nvim', { 'branch': 'for-end' }
endfunction

function! __Configure_Headlines()
    if $d
        highlight Headline guibg=#3f3f3f
        highlight CodeBlock guibg=#2f2f2f
        highlight Quote none
    else
        highlight Headline guibg=#e4e4e4
        highlight CodeBlock guibg=#efefef
        highlight Quote none
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
            headline_highlights = {"Headline"},
            codeblock_highlight = "CodeBlock",
            dash_highlight = "",
            dash_string = "",
            quote_string = ">",
            fat_headlines = false,
        }
    }
EOF
endfunction
