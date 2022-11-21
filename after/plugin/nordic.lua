-- Fixes for red-green colorblind
--
if lvim.colorscheme == "nordic" then
  vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", { foreground = "#CC5A1B" }) -- Was #bf616a
  vim.api.nvim_set_hl(0, "DiagnosticError", { foreground = "#CC5A1B" }) -- Was #bf616a
  vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { foreground = "#a9b1d6", background = "#2e3440" })
  vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { foreground = "#16161e", background = "#2e3440" })
end
