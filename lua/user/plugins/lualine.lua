local Lualine = {}

Lualine.config = function()
  if not lvim.builtin.lualine.active then
    return
  end

  -- Nord is supported by lualine.nvim
  -- https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md
  if lvim.colorscheme == "nordic" then
    lvim.builtin.lualine.options.theme = "nord"
  else
    lvim.builtin.lualine.options.theme = "auto"
  end
end

return Lualine
