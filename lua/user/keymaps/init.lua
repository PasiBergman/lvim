--
-- Load Which-key config
--
require "user.keymaps.which-key"
--
--
-- Other GENERIC keymaps below. These are not specific to any plugin.
--
lvim.leader = "space"

-- Save with macOS Cmd-S
lvim.keys.normal_mode["<D-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
--
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Keep centered
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "J", "mzJ`z", { noremap = true, silent = true })
-- Undo break points
vim.keymap.set("i", ".", ".<C-g>u", { noremap = true, silent = true })
vim.keymap.set("i", ",", ",<C-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "!", "!<C-g>u", { noremap = true, silent = true })
vim.keymap.set("i", "?", "?<C-g>u", { noremap = true, silent = true })

-- Paste and move highlighted text to void register
vim.keymap.set("x", "<leader>P", '"_dP')

-- When deleting, put deleted char/text to x or d register
vim.keymap.set("n", "x", '"xx', { noremap = true, silent = true })
vim.keymap.set("n", "dd", '"ddd', { noremap = true, silent = true })
vim.keymap.set("n", "D", '"dD', { noremap = true, silent = true })

-- Quiclist and local list jumping
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- -- See lua/user/commands/init.lua
-- vim.keymap.set("n", "<F5>", ":ExecSh<cr>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<F6>", ":ExecVsh<cr>", { noremap = true, silent = true })
-- Close buffers with name "No name"
-- vim.keymap.set("n", "<F7>", [[:bdel! "No name"<cr>]], { noremap = true, silent = true })

-- Remove LunarVim keymaps
lvim.keys.visual_mode = {}
