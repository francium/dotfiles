utils = require "user.utils"
local idempotent_keymap_set = utils.idempotent_keymap_set

-- Reload config
idempotent_keymap_set("n", "<f2>", function()
  for name, _ in pairs(package.loaded) do
    if name:match "^user" then
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  vim.notify("Configuration reloaded", vim.log.levels.INFO)
end, { noremap = true })

-- Edit config in a tab
idempotent_keymap_set("n", "<leader><f2>", "<cmd>tabedit $MYVIMRC<cr>", { noremap = true })

idempotent_keymap_set("n", "<leader>w", "<cmd>w<cr>", { noremap = true })
idempotent_keymap_set("n", "<leader>wa", "<cmd>wa<cr>", { noremap = true })

idempotent_keymap_set(
  "n",
  "<esc>",
  "<cmd>nohlsearch<cr>",
  { desc = "Clear search", silent = true, noremap = true }
)

-- Toggle quickfix window
idempotent_keymap_set("n", "<leader>q", function()
  local windows = vim.fn.getwininfo()
  for _, win_info in pairs(windows) do
    if win_info.quickfix == 1 then
      vim.cmd.cclose()
      return
    end
  end
  vim.cmd.copen()
end, { noremap = true })

idempotent_keymap_set({ "n", "i", "v" }, "<left>", "")
idempotent_keymap_set({ "n", "i", "v" }, "<right>", "")
idempotent_keymap_set({ "n", "i", "v" }, "<up>", "")
idempotent_keymap_set({ "n", "i", "v" }, "<down>", "")
idempotent_keymap_set({ "n", "i", "v" }, "<c-h>", "")
idempotent_keymap_set({ "n", "i", "v" }, "<c-l>", "")
idempotent_keymap_set({ "n", "i", "v" }, "<c-j>", "")
idempotent_keymap_set({ "n", "i", "v" }, "<c-k>", "")

idempotent_keymap_set("n", "H", "gT", { desc = "Next tab", noremap = true })
idempotent_keymap_set("n", "L", "gt", { desc = "Previous tab", noremap = true })
idempotent_keymap_set("n", "(", "zh", { desc = "Scroll left", noremap = true })
idempotent_keymap_set("n", ")", "zl", { desc = "Scroll right", noremap = true })

idempotent_keymap_set("n", "<leader>`", function()
  vim.cmd "wall"
  vim.cmd "silent !touch .watchfile"
  vim.notify ".watchfile updated"
end, { noremap = true })

idempotent_keymap_set("n", "<f4>", function()
  if vim.opt.background:get() == "dark" then
    vim.opt.background = "light"
  else
    vim.opt.background = "dark"
  end
end, { noremap = true })

-- TODO
-- Couldn't figure out how to make it work with vim.keymap.set
vim.cmd 'vmap <leader>y "+y:echo "Text copied to clipboard"<cr>'
