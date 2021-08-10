-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufEnter", "*", "lua require'my.highlights'" },
  { "BufEnter", "*.tmux", "set filetype=sh" },
  { "InsertEnter", "*", "highlight PmenuSel ctermfg=242 ctermbg=0 gui=bold guifg=#88c0d0 guibg=#8091b2" },
}
