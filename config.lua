-- Colors
require "my.colors"

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

-- Telescope
require("my.telescope").setup_mappings()
