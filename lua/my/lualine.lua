local components = require "core.lualine.components"

-- Remove treesitter from the config
lvim.builtin.lualine.sections.lualine_x = {
  components.diagnostics,
  components.lsp,
  components.filetype,
}

-- Replace progressbar with location
lvim.builtin.lualine.sections.lualine_z = {
  components.location,
}

-- Use nord theme
lvim.builtin.lualine.options.theme = "nord"

-- Remove bold from lsp info and set foreground color to dimmer one
lvim.builtin.lualine.on_config_done = function(lualine, config)
  config.sections.lualine_x[2].color.gui = "none"
  config.sections.lualine_x[2].color.fg = "#E5E9F0"
  lualine.setup(config)
end
