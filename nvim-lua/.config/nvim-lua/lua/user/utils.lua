local mod = {}

function mod.idempotent_keymap_set(modes, lhs, rhs, opts)
  opts = opts or {}
  pcall(function()
    vim.keymap.del(modes, lhs)
  end)
  vim.keymap.set(modes, lhs, rhs, opts)
end

return mod
