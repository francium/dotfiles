" Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
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
                    folder = false,
                    file = false,
                    git = false,
                },
            },
            special_files = {},
        },
        filters = {
            dotfiles = false,
        },
        git = {
            ignore = false,
        },
    })
EOF
    nmap <leader><tab> :NvimTreeToggle<CR>
    nmap <leader>gg :NvimTreeFindFile<CR>
endfunction

