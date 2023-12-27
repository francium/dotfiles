vim.api.nvim_create_user_command(
  "EnableHyphenedKeywords",
  function ()
    vim.opt_local.iskeyword:append("-")
  end,
  {
    force = true,
  }
)
