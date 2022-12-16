-- Use filetype sh with files with tmux extension
local augroup = "ftdetect_markdown"
local eventlist = { "BufRead", "BufNewFile" }
local globs = { "*.wiki", "*.vimwiki" }
local aucommand = "set filetype=markdown"

vim.api.nvim_create_augroup(augroup, { clear = true })
vim.api.nvim_create_autocmd(eventlist, {
  pattern = globs,
  command = aucommand,
})
