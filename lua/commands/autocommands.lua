-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocmds = {
  { "BufEnter", { pattern = { "*.vue" }, command = "set nosmartindent" } },
  { "BufLeave", { pattern = { "*.vue" }, command = "set smartindent" } },
}
