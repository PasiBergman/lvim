--
-- Which-key config
--
require "user.keymaps.which-key"
--
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

vim.api.nvim_set_keymap("n", "x", '"xx', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "dd", '"ddd', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "D", '"dD', { noremap = true, silent = true })
-- Keep centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
-- Undo break points
vim.api.nvim_set_keymap("i", ".", ".<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", ",", ",<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "!", "!<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "?", "?<C-g>u", { noremap = true, silent = true })

-- -- Move text
-- vim.api.nvim_set_keymap("v", "J", "'>+1<CR>gv=gv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "K", "'<-2<CR>gv=gv", { noremap = true, silent = true })
-- Paste last yanked (not deleted) register
-- vim.api.nvim_set_keymap("n", ",p", '"0p', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", ",P", '"0P', { noremap = true, silent = true })

-- -- See lua/user/commands/init.lua
-- vim.api.nvim_set_keymap("n", "<F5>", ":ExecSh<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<F6>", ":ExecVsh<cr>", { noremap = true, silent = true })
-- Close buffers with name "No name"
-- vim.api.nvim_set_keymap("n", "<F7>", [[:bdel! "No name"<cr>]], { noremap = true, silent = true })

-- Remove LunarVim keymaps
lvim.keys.visual_mode = {}

-- I use caps lock as ESC so the following LunarVim keymaps are not needed.
-- vim.api.nvim_del_keymap("i", "jj")
-- vim.api.nvim_del_keymap("i", "jk")
-- vim.api.nvim_del_keymap("i", "kj")
