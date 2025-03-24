require "user.base"
require "user.mappings"
require "user.commands"

-- Make sure at minimum user.base is loaded before this (lazy.nvim needs
-- leader and localleader set so its mapping work correctly)
require "user.lazy"
