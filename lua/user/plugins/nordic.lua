local M = {}
-- Fixes for red-green colorblind
--
--
M.nordic_changes = function()
  if vim.g.colors_name ~= "nordic" or not lvim.colorblind_mode then
    return
  end

  vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { foreground = "#a9b1d6", background = "#2e3440" })
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { foreground = "#16161e", background = "#2e3440" })

  vim.api.nvim_set_hl(0, "CmpItemMenu", { background = "#2e3440" })
  vim.api.nvim_set_hl(0, "PmenuThumb", { foreground = "#88c0d0", background = "#b8babf" })

  vim.api.nvim_set_hl(0, "NormalFloat", { foreground = "#e5e9f0", background = "#2e3440" })

  vim.api.nvim_set_hl(0, "Error", { foreground = "#dd5050", bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticError", { foreground = "#dd5050", bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { foreground = "#dd5050", bold = true })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { underdashed = true })
  vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { underdashed = true })

  vim.api.nvim_set_hl(0, "DiagnosticWarn", { foreground = "#e0af68" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { foreground = "#e0af68" })

  vim.api.nvim_set_hl(0, "DiagnosticInfo", { foreground = "#008cb3" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { foreground = "#008cb3" })

  vim.api.nvim_set_hl(0, "DiagnosticHint", { foreground = "#1abc9c" })
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { foreground = "#1abc9c" })

  vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { background = "#3b4252" })
  vim.api.nvim_set_hl(0, "IlluminatedWordRead", { background = "#3b4252" })
  vim.api.nvim_set_hl(0, "IlluminatedWordText", { background = "#3b4252" })
end

return M
