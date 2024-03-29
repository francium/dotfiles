-------------------------------------------------------------------------------
-- Base Config ----------------------------------------------------------------
-------------------------------------------------------------------------------
-- There are some options neovim enables by default. Those are omitted from
-- this config. See `:help *vim-differences`.
-------------------------------------------------------------------------------

-- If you use vim inside tmux, see https://github.com/vim/vim/issues/993.
-- Set Vim-specific sequences for RGB colors.
-- TODO: See if this is still required. Try removing
vim.o.t_8b = "^[[48;2;%lu;%lu;%lum"
vim.o.t_8f = "^[[38;2;%lu;%lu;%lum"

-- Fix light colorschemes background issue. Disable Background Color Erase
-- (BCE).
-- TODO: See if this is still required. Try removing
vim.o.t_ut = nil

-- Enable 24-bit RGB colors in the TUI
if vim.fn.has("termguicolors") then
    vim.o.termguicolors = true
end

-- Default (4000) is too slow. Some plugins use this (coc, etc.).
vim.o.updatetime = 100

-- Increase undo limit.
vim.o.undolevels = 25000

-- Enable spellchecking.
vim.o.spell = true

-- Case insensitive searching by default.
vim.o.ignorecase = true
-- But allow searching case-sensitive with capitalized characters.
vim.o.smartcase = true

-- -- `>` and `<` round the indenting to multiples of `shiftwidth`.
vim.o.shiftround = true

-- Highlight current line.
vim.o.cursorline = true

-- Don't softwrap long lines.
vim.o.wrap = false

-- When `wrap` is enabled, show this character at the start of the soft-wrapped
-- line.
vim.o.showbreak = "↪ "

-- When `wrap` is enabled, wrap long lines at a character in `breakat` rather
-- than at the last character that fits on the screen.
vim.o.linebreak = true

-- Disable swapfiles
vim.o.swapfile = false

-- Don't write to backup file, to avoid issues with some build tools that watch
-- files.
vim.o.writebackup = false

-- Show special characters
vim.o.list = true
-- Special characters to show.
vim.o.listchars = "tab:░░"

-- Enable line numbers.
vim.o.number = true
-- Enable relative numbering. Sometimes it can be slow however.
vim.o.relativenumber = true

-- Set minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 2

-- Disable tabs for indenting.
vim.o.expandtab = true

-- Don't fold things automatically
vim.o.foldlevelstart = 99

-- Splitting behavior
vim.o.splitbelow = true
vim.o.splitright = true
-- Don't resize automatically when split or split closed
vim.o.equalalways = false

-- TODO: Play around with this to get a better understanding (with coc, etc)
-- " Fix deoplete being too eager and selecting first option automatically
-- " set completeopt+=noinsert
-- set completeopt =longest,menu
-- " set completeopt-=preview

-- " Force quickfix window to open at bottom instead of below a vertical split
-- autocmd FileType qf wincmd J
--
-- " Terminal
--     " Start in insert mode
--     autocmd BufWinEnter,WinEnter term://* startinsert
--
--     autocmd TermOpen * setlocal nospell
--     autocmd TermOpen * setlocal  nonumber norelativenumber

-- " Add suffixes for related files so `gf` works for files without extensions
-- augroup suffixes
--     autocmd!
--
--     let associations = [
--         \["javascript", ".js,.jsx,.ts,.tsx"],
--     \]
--
--     for ft in associations
--         execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
--     endfor
-- augroup END

-- TODO: Should the autocmd be here or in another file? Should it be part of a
-- augroup?
-- 90 column warning
-- only add to file buffer instead of non-file buffers like coc
-- and NERDTree -- does result in extension-less files not receiving
-- colorcolumns
-- autocmd FileType * setlocal colorcolumn=80,90,100,120
--
-- " Disable mouse clicking (scrolling not affected)
-- autocmd BufEnter * set mouse=
--
