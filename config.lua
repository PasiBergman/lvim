-- Colors and colorscheme options
require "my.colors"
require "my.colorschemes"

-- General lvim configuration
require "my.general"

--  Builtin configuration
require "my.builtin"

-- Additional Plugins
require "my.plugins"

-- Key mappings and which-key
require "my.keymaps"

-- Autocommands
require "my.autocommands"

-- LSP
require "my.lsp"

-- Additional JSON schemas
require("my.json-schemas").setup()

-- Highlight
require "my.highlights"

-- Treesitter
require "my.treesitter"

-- Configure tailwindcss language server (conditionally)
require "my.tailwindcss"

-- Configure emmet language server (conditionally)
require "my.emmet"

-- Commands etc
require "my.commands"
