-- Use filetype sh with files with tmux extension
local augroup = "ftdetect_term"
local eventlist = { "TermOpen" }
local globs = { "term://*" }
local aucommand = "set filetype=term"

vim.api.nvim_create_augroup(augroup, { clear = true })
vim.api.nvim_create_autocmd(eventlist, {
  pattern = globs,
  command = aucommand,
})
