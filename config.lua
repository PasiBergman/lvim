-- General configuration
require "options"

-- Themes/Colorschemes and highlights
require "themes"

-- Configure plugins
require "plugins"

-- Key mappings and which-key
require "keymaps"

-- Commands
require "commands"

-- Autocommands
require "commands.autocommands"

-- LSP
require "lsp"

vim.notify(
  "Upcoming merge from branch feature/update-2022-10. Settings will change considerably. Merge will be done around November 12th 2022.",
  vim.log.levels.WARN
)
