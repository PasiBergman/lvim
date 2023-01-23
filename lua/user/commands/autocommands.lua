-- Use filetype sh with files with tmux extension
--
--
local status_ok, highlights = pcall(require, "user.plugins.tokyonight")
if not status_ok then
  return
end

local augroup = "colorscheme_tokyonight"
local eventlist = { "ColorScheme" }
local globs = { "*" }
local aucommand = highlights.tokyonight_changes

vim.api.nvim_create_augroup(augroup, { clear = true })
vim.api.nvim_create_autocmd(eventlist, {
  pattern = globs,
  callback = aucommand,
})

status_ok, highlights = pcall(require, "user.plugins.nordic")
if not status_ok then
  return
end

augroup = "colorscheme_nordic"
eventlist = { "ColorScheme" }
globs = { "*" }
aucommand = highlights.nordic_changes

vim.api.nvim_create_augroup(augroup, { clear = true })
vim.api.nvim_create_autocmd(eventlist, {
  pattern = globs,
  callback = aucommand,
})
