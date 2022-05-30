local NvimTree = {}

NvimTree.config = function()
  if not lvim.builtin.nvimtree.active then
    return
  end

  lvim.builtin.nvimtree.show_icons.git = 1
  lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true
end

return NvimTree
