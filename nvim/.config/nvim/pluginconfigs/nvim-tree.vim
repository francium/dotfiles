Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Close if NvimTree window is last one open in current tab page
" Based on https://stackoverflow.com/questions/2066590
autocmd bufenter NvimTree_* if winnr("$") == winnr() | quit | endif

function __Configure_NvimTree()
lua << EOF
    vim.g.loaded = 1
    vim.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            adaptive_size = false,
        },
        renderer = {
            group_empty = false,
            icons = {
                show = {
                    file = false,
                    folder = false,
                    folder_arrow = false,
                    git = false
                },
                symlink_arrow = " -> ",
                glyphs = {
                    symlink = ""
                },
            },
            special_files = {}
        },
        filters = {
            dotfiles = false,
        },
        git = {
            enable = false,
            ignore = false,
        },
    })
EOF
    nmap <leader><tab> :NvimTreeToggle<CR>
    nmap <leader>gg :NvimTreeFindFile<CR>
endfunction
