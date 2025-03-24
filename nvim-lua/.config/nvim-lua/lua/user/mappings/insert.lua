utils = require "user.utils"
local idempotent_keymap_set = utils.idempotent_keymap_set

idempotent_keymap_set("i", "jj", "<esc>", { noremap = true })

-- TODO: Not working
idempotent_keymap_set("i", "<c-h>", "<left>", { noremap = true })
idempotent_keymap_set("i", "<c-l>", "<right>", { noremap = true })

-- Basic auto closing for quotes and brackets
idempotent_keymap_set(
  "i",
  "```",
  "```",
  { desc = "Treat ``` as literal, reduces input handling pause", noremap = true }
)
idempotent_keymap_set("i", "``i", "``<esc>i", { noremap = true })
idempotent_keymap_set("i", "''i", "''<esc>i", { noremap = true })
idempotent_keymap_set("i", '""i', '""<esc>i', { noremap = true })
idempotent_keymap_set("i", "<<i", "<><esc>i", { noremap = true })
idempotent_keymap_set("i", "((i", "()<esc>i", { noremap = true })
idempotent_keymap_set("i", "((o", "(<cr>)<esc>ko", { noremap = true })
idempotent_keymap_set("i", "[[i", "[]<Esc>i", { noremap = true })
idempotent_keymap_set("i", "[[o", "[<CR>]<Esc>ko", { noremap = true })
idempotent_keymap_set("i", "{{i", "{}<Esc>i", { noremap = true })
idempotent_keymap_set("i", "{{o", "{<CR>}<Esc>ko", { noremap = true })
idempotent_keymap_set("i", "{{{i", "{{}}<Esc>hi", { noremap = true })
idempotent_keymap_set("i", "{{{o", "{{<CR>}}<Esc>ko", { noremap = true })
