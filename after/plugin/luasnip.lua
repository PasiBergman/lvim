-- set keymap for faster reaload when changing this file
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/lvim/after/plugin/luasnip.lua<CR>")

-- Add snippets
pcall(require, "user.luasnip.all")
pcall(require, "user.luasnip.cs")
pcall(require, "user.luasnip.lua")
pcall(require, "user.luasnip.json")
pcall(require, "user.luasnip.typescript")
pcall(require, "user.luasnip.markdown")
