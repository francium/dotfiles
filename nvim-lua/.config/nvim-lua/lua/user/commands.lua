vim.api.nvim_create_user_command("EnableHyphenedKeywords", function()
  vim.opt_local.iskeyword:append "-"
end, {
  force = true,
})

vim.api.nvim_create_user_command("CopyRelDirPath", function()
  local value = vim.fn.expand "%:h"
  vim.fn.setreg("+", value)
  vim.notify('"' .. value .. '" copied to clipboard')
end, {
  force = true,
})

vim.api.nvim_create_user_command("CopyFilePath", function()
  local value = vim.fn.expand "%"
  vim.fn.setreg("+", value)
  vim.notify('"' .. value .. '" copied to clipboard')
end, {
  force = true,
})

vim.api.nvim_create_user_command("CopyFileName", function()
  local value = vim.fn.expand "%:t"
  vim.fn.setreg("+", value)
  vim.notify('"' .. value .. '" copied to clipboard')
end, {
  force = true,
})

vim.api.nvim_create_user_command("FormatJson", function()
  vim.cmd "%!python -m json.tool"
end, {
  force = true,
})

vim.api.nvim_create_user_command("FormatJsonRange", function()
  vim.notify "Not implemented"
end, {
  force = true,
  range = true,
})

vim.api.nvim_create_user_command("NewHere", function(command)
  vim.print(command)
  local path = vim.fn.expand "%:p:h" .. "/" .. command.args
  vim.cmd("edit " .. path)
  vim.cmd "write"
end, {
  nargs = 1,
  force = true,
})

vim.api.nvim_create_user_command("CloseAllOtherBuffers", "%bd | e#", {
  force = true,
})

vim.api.nvim_create_user_command("CloseAll", function(command)
  vim.cmd("%bd | e#")
  vim.cmd("tabnew scratch")
  vim.cmd("noswapfile hide enew")
  vim.opt_local.buftype = "nofile"
  vim.opt_local.bufhidden = "hide"
  vim.opt_local.buflisted = false

  vim.cmd("tabnext")
  vim.cmd("bd")
end, {
  force = true,
})
