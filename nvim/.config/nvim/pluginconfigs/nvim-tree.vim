Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

function __Configure_NvimTree()
lua << EOF
    vim.g.loaded = 1
    vim.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
            adaptive_size = false,
            mappings = {
                list = {
                    -- { key = "u", action = "dir_up" },
                    -- { key = "<C-I>", action = "toggle_file_info" },
                    -- { key = "<C-K>", action = nil },
                },
            },
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

