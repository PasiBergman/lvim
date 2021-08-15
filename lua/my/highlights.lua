--
-- Collection of highlights changes
--
-- LSP diagnostics virtual texts
vim.cmd [[highlight LspDiagnosticsUnderlineInformation gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineHint gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineWarning gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineError gui=undercurl]]
--
-- sonokai andromeda
--
if lvim.colorscheme == "sonokai" and vim.g.sonokai_style == "andromeda" then
  -- Bufferline
  vim.cmd [[highlight BufferVisibleMod guifg=#d8dee9 guibg=#4c566a]]
  vim.cmd [[highlight BufferCurrentMod guifg=#d8dee9 guibg=#2e3440 gui=bold]]
  vim.cmd [[highlight BufferInactiveMod guifg=#d8dee9 guibg=#3b4252]]
end
--
-- nordbuddy
--
if lvim.colorscheme == "nordbuddy" then
  -- Dropdown menu
  vim.cmd [[highlight PmenuSel ctermfg=242 ctermbg=0 gui=bold guifg=#88c0d0 guibg=#8091b2]]
  -- Bufferline
  vim.cmd [[highlight BufferVisibleMod guifg=#88c0d0 guibg=#4c566a]]
  vim.cmd [[highlight BufferCurrentMod guifg=#88c0d0 guibg=#2e3440 gui=bold]]
  vim.cmd [[highlight BufferInactiveMod guifg=#88c0d0 guibg=#3b4252]]
end
