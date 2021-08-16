-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  { "BufEnter", "*.tmux", "set filetype=sh" },
}

if lvim.colorscheme == "sonokai" then
  lvim.autocommands.custom_groups = vim.list_extend(
    lvim.autocommands.custom_groups,
    { { "InsertEnter", "*", "highlight PmenuSel ctermfg=242 ctermbg=0 gui=bold guifg=#2b2d3a guibg=#9ed06c" } }
  )
end

if lvim.colorscheme == "nordbuddy" then
  lvim.autocommands.custom_groups = vim.list_extend(
    lvim.autocommands.custom_groups,
    { { "InsertEnter", "*", "highlight PmenuSel ctermfg=242 ctermbg=0 gui=bold guifg=#88c0d0 guibg=#8091b2" } }
  )
end
