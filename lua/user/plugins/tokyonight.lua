local M = {}
-- Fixes for red-green colorblind
--
M.tokyonight_changes = function()
  if vim.g.colors_name ~= "tokyonight" or not lvim.colorblind_mode then
    return
  end

  vim.api.nvim_set_hl(0, "HopNextKey", { foreground = "#ff8800", bold = true })
end

return M
