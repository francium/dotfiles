utils = require "user.utils"
local idempotent_keymap_set = utils.idempotent_keymap_set

-- Move left/right using ctrl+h/l
idempotent_keymap_set("c", "<c-h>", "<left>", { noremap = true })
idempotent_keymap_set("c", "<c-l>", "<right>", { noremap = true })
