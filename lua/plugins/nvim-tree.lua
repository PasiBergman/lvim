local NvimTree = {}

NvimTree.config = function()
  if not lvim.builtin.nvimtree.active then
    return
  end

  -- lvim.builtin.nvimtree.setup.show_icons.git = 1
  -- lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

  lvim.builtin.nvimtree.setup.update_cwd = false
end

return NvimTree
