local clr = lvim.colorscheme
--
-- Collection of highlights changes
--
-- LSP diagnostics virtual texts and codelens
vim.cmd [[highlight LspDiagnosticsUnderlineInformation gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineHint gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineWarning gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineError gui=undercurl]]
--CodeLens
vim.cmd [[highlight LspCodeLens guifg=#654F61]]
--
-- sonokai andromeda
--
if clr == "sonokai" and vim.g.sonokai_style == "andromeda" then
  -- Completion menu selected item
  vim.cmd [[highlight PmenuSel ctermfg=242 ctermbg=0 gui=none guifg=#2b2d3a guibg=#9ed06c]]
  -- Bufferline
  vim.cmd [[highlight BufferVisibleMod guifg=#d8dee9 guibg=#4c566a]]
  vim.cmd [[highlight BufferCurrentMod guifg=#d8dee9 guibg=#2e3440 gui=bold]]
  vim.cmd [[highlight BufferInactiveMod guifg=#d8dee9 guibg=#3b4252]]
end
--
-- *nord*
--
if string.find(clr, "nord") ~= nil then
  -- Completion menu selected item
  vim.cmd [[highlight PmenuSel ctermfg=242 ctermbg=0 gui=none guifg=#eeffff guibg=#5D81AC]]

  if clr ~= "nordic" then
    return
  end

  -- Bufferline
  vim.cmd [[highlight BufferVisibleMod guifg=#88c0d0 guibg=#4c566a]]
  vim.cmd [[highlight BufferCurrentMod guifg=#88c0d0 guibg=#2e3440 gui=bold]]
  vim.cmd [[highlight BufferInactiveMod guifg=#88c0d0 guibg=#3b4252]]
end
