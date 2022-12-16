-- Use filetype sh with files with tmux extension
local augroup = "ftdetect_tmux"
local eventlist = { "BufRead", "BufNewFile" }
local globs = { "*.tmux", ".tmux*" }
local aucommand = "set filetype=sh"

vim.api.nvim_create_augroup(augroup, { clear = true })
vim.api.nvim_create_autocmd(eventlist, {
  pattern = globs,
  command = aucommand,
})
