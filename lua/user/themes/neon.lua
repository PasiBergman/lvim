local Neon = {}

Neon.config = function()
  -- neon coloscheme
  vim.g.neon_style = "default" -- default, doom, dark, light
  vim.g.neon_italic_comment = true
  vim.g.neon_italic_keywork = true
  vim.g.neon_italic_boolean = true
  vim.g.neon_italic_function = true
  vim.g.neon_italic_variable = false
  vim.g.neon_bold = true
  vim.g.neon_transparent = false
end

return Neon
