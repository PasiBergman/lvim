--
-- Collection of highlights changes
--
-- LSP diagnostics virtual texts
vim.cmd [[highlight LspDiagnosticsUnderlineInformation gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineHint gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineWarning gui=undercurl]]
vim.cmd [[highlight LspDiagnosticsUnderlineError gui=undercurl]]
-- Dropdown menu
vim.cmd [[highlight PmenuSel ctermfg=242 ctermbg=0 gui=bold guifg=#88c0d0 guibg=#8091b2]]
-- Bufferline
vim.cmd [[highlight BufferVisibleMod guifg=#88c0d0 guibg=#4c566a]]
vim.cmd [[highlight BufferCurrentMod guifg=#88c0d0 guibg=#2e3440 gui=bold]]
vim.cmd [[highlight BufferInactiveMod guifg=#88c0d0 guibg=#3b4252]]
