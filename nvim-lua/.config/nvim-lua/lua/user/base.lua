-------------------------------------------------------------------------------
-- Base Config ----------------------------------------------------------------
-------------------------------------------------------------------------------
-- There are some options neovim enables by default. Those are omitted from
-- this config. See `:help *vim-differences`.
-------------------------------------------------------------------------------

-- If you use vim inside tmux, see https://github.com/vim/vim/issues/993.
-- Set Vim-specific sequences for RGB colors.
-- TODO: See if this is still required. Try removing
-- vim.opt.t_8b = "^[[48;2;%lu;%lu;%lum"
-- vim.opt.t_8f = "^[[38;2;%lu;%lu;%lum"

-- Fix light colorschemes background issue. Disable Background Color Erase
-- (BCE).
-- TODO: See if this is still required. Try removing
-- vim.opt.t_ut = nil

-- Enable 24-bit RGB colors in the TUI
if vim.fn.has "termguicolors" then
  vim.opt.termguicolors = true
end

-- Default (4000) is too slow. Some plugins use this (coc, etc.).
vim.opt.updatetime = 100

-- Increase undo limit.
vim.opt.undolevels = 25000

-- Enable spellchecking.
vim.opt.spell = true

-- Case insensitive searching by default.
vim.opt.ignorecase = true
-- But allow searching case-sensitive with capitalized characters.
vim.opt.smartcase = true

-- `>` and `<` round the indenting to multiples of `shiftwidth`.
vim.opt.shiftround = true

-- Highlight current line.
vim.opt.cursorline = true

-- Don't softwrap long lines.
vim.opt.wrap = false

-- When `wrap` is enabled, show this character at the start of the soft-wrapped
-- line.
vim.opt.showbreak = "↪ "

-- When `wrap` is enabled, wrap long lines at a character in `breakat` rather
-- than at the last character that fits on the screen.
vim.opt.linebreak = true

-- Disable swapfiles
vim.opt.swapfile = false

-- Don't write to backup file, to avoid issues with some build tools that watch
-- files.
vim.opt.writebackup = false

-- Show special characters
vim.opt.list = true
-- Special characters to show.
vim.opt.listchars = "tab:░░"

-- Enable line numbers.
vim.opt.number = true
-- Enable relative numbering. Sometimes it can be slow however.
vim.opt.relativenumber = true

-- Set minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 2

-- Disable tabs for indenting.
vim.opt.expandtab = true

-- Don't fold things automatically
vim.opt.foldlevelstart = 99

-- Splitting behavior
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Don't resize automatically when split or split closed
vim.opt.equalalways = false

-- Show vertical column markers
vim.opt.colorcolumn = { "80", "90", "100" }

-- Disable mouse clicking, but keep scrolling
vim.opt.mouse = ""

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = "\\"
vim.g.maplocalleader = " "
