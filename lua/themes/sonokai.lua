local Sonokai = {}

Sonokai.config = function()
  vim.g.sonokai_style = "andromeda"
  vim.g.sonokai_enable_italic = 1
  vim.g.sonokai_disable_italic_comment = 0
  vim.g.sonokai_menu_selection_background = "green"
  vim.g.sonokai_transparent_background = 1
  vim.g.sonokai_diagnostic_virtual_text = "colored"
  vim.g.sonokai_better_performance = 1
end

return Sonokai
