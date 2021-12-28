local NvimTree = {}

NvimTree.config = function()
  if not lvim.builtin.nvimtree.active then
    return
  end

  lvim.builtin.nvimtree.setup.side = "left"
  lvim.builtin.nvimtree.show_icons.git = 1
  lvim.builtin.nvimtree.setup.hide_dotfiles = 0
  lvim.builtin.nvimtree.setup.auto_close = 1
end

return NvimTree
