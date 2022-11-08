-- plugins
require("user/packer-setup")
require("user/packer")

-- vim settings
require("user/settings")

-- these plugins need to be config first
-- since they're used by other plugins as dependencies
require("user/cmp")
require("user/treesitter")
require("user/telescope")

-- other plugins
require("user/commentary")
require("user/lsp")
require("user/lualine")
-- require("user/gitsigns")
require("user/keymap")
