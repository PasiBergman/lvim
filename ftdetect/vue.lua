-- Disable smart indent for Vue files
local augroup = "ftdetect_vue"
local eventlist = { "BufRead", "BufNewFile" }
local globs = { "*.vue" }
local aucommand = "setlocal nosmartindent"

vim.api.nvim_create_augroup(augroup, { clear = true })
vim.api.nvim_create_autocmd(eventlist, {
	pattern = globs,
	command = aucommand,
})
