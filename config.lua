-- General lvim configuration
require "my.general"

-- Colors and colorscheme options
require "my.colorschemes"
require "my.colors"
require "my.lualine"

-- Builtin configuration
require "my.builtin"

-- Additional Plugins
require "my.plugins"

-- Key mappings and which-key
require "my.keymaps"

-- Autocommands
require "my.autocommands"

-- LSP
require "my.lsp"

-- Treesitter
require "my.treesitter"

-- Configure tailwindcss language server (conditionally)
require "my.tailwindcss"

-- Configure emmet language server (conditionally)
require "my.emmet"

-- Commands etc
require "my.commands"

-- Telescope
require "my.telescope"

-- Debug (DAP)
if lvim.builtin.dap.active then
  require("my.dap").config()
end
