local Barbar = {}

Barbar.config = function()
  vim.cmd "highlight BufferCurrentMod guifg=#ebcb8b guibg=#2e3440"
  vim.cmd "highlight BufferInactiveMod guifg=#88c0d0 guibg=#3b4252"
  vim.cmd "highlight BufferVisibleMod guifg=#88c0d0 guibg=#4c566a"
end

return Barbar
