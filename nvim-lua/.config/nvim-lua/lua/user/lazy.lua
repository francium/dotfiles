-- Bootstrap lazy.nvim, taken from lazy.nvim setup guide
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.print("Installing lazy.nvim...")
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Import plugin from the lua/plugins directory
    { import = "plugins" },
  },

  -- Configure any other settings here. See the documentation for more details.

  -- Colorscheme that will be used when installing plugins.
  install = { colorscheme = { "default" } },

  -- Automatically check for plugin updates
  checker = { enabled = true },

  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "none",
    -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
    backdrop = 60,
    title = nil, ---@type string only works when border is not "none"
    title_pos = "center", ---@type "center" | "left" | "right"
    -- Show pills on top of the Lazy window
    pills = true, ---@type boolean
    icons = {
      cmd = "x ",
      config = "x",
      debug = "● ",
      event = "x ",
      favorite = " ",
      ft = "x ",
      init = "x ",
      import = "x ",
      keys = "x ",
      lazy = "x ",
      loaded = "●",
      not_loaded = "○",
      plugin = "x ",
      runtime = "x ",
      require = "x ",
      source = "x ",
      start = "x ",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
})
