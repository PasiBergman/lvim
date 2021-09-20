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
lvim.builtin.lualine.on_config_done = function(lualine)
  local config = lualine.get_config()
  config.sections.lualine_x[2].color.gui = "none"
  config.sections.lualine_x[2].color.fg = "#E5E9F0"
  lualine.setup(config)
end

--
-- Creating own custom lualine theme
--
--[[
local colors = {
  color2 = "#0f1419",
  color3 = "#ffee99",
  color4 = "#e6e1cf",
  color5 = "#14191f",
  color13 = "#b8cc52",
  color10 = "#36a3d9",
  color8 = "#f07178",
  color9 = "#3e4b59",
}

lvim.builtin.lualine.options.theme = {
  normal = {
    c = { fg = colors.color9, bg = colors.color2 },
    a = { fg = colors.color2, bg = colors.color10, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  insert = {
    a = { fg = colors.color2, bg = colors.color13, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  visual = {
    a = { fg = colors.color2, bg = colors.color3, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  replace = {
    a = { fg = colors.color2, bg = colors.color8, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
  inactive = {
    c = { fg = colors.color4, bg = colors.color2 },
    a = { fg = colors.color4, bg = colors.color5, gui = "bold" },
    b = { fg = colors.color4, bg = colors.color5 },
  },
}
]]
