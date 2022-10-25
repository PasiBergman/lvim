-- Fixes for red-green colorblind
--
print "AFTER: nordic.lua"

if lvim.colorscheme == "nordic" then
  vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", { foreground = "#CC5A1B" }) -- Was #bf616a
  vim.api.nvim_set_hl(0, "DiagnosticError", { foreground = "#CC5A1B" }) -- Was #bf616a
end
