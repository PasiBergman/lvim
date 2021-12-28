local Tokyonight = {}

Tokyonight.config = function()
  vim.g.tokyonight_colors = { error = "#ff5500" }
  vim.g.tokyonight_italic_functions = false
  vim.g.tokyonight_sidebars = { "NvimTree", "terminal" }
end

return Tokyonight
