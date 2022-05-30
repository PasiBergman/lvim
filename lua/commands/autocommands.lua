-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocmds = {
  { "BufEnter", { pattern = { "*.tmux" }, command = "set filetype=sh" } },
  { "BufEnter", { pattern = { "*.vue" }, command = "set nosmartindent" } },
  { "BufLeave", { pattern = { "*.vue" }, command = "set smartindent" } },
}

if lvim.colorscheme == "sonokai" then
  lvim.autocmds = vim.list_extend(lvim.autocmds, {
    {
      "InsertEnter",
      {
        pattern = { "*" },
        command = "highlight PmenuSel ctermfg=242 ctermbg=0 gui=bold guifg=#2b2d3a guibg=#9ed06c",
      },
    },
  })
end

if lvim.colorscheme == "nordic" then
  lvim.autocmds = vim.list_extend(lvim.autocmds, {
    {
      "InsertEnter",
      { pattern = "*", command = "highlight PmenuSel ctermfg=242 ctermbg=0 gui=bold guifg=#2a3a33 guibg=#8091b2" },
    },
    -- SymbolsOutline fix
    { "BufEnter", { pattern = { "*" }, command = "highlight Comment guifg=#667084 ctermfg=0" } },
    { "BufEnter", { pattern = { "*" }, command = "highlight Visual guibg=#3B4252" } },
  })
end
