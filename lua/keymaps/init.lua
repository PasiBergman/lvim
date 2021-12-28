-- Yank to line end - obsolete on Neovim 0.6+
-- vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })
-- Character delete uses specific register
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
-- Move text
-- vim.api.nvim_set_keymap("v", "J", "'>+1<CR>gv=gv", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "K", "'<-2<CR>gv=gv", { noremap = true, silent = true })
-- Paste last yanked (not deleted) register
-- vim.api.nvim_set_keymap("n", ",p", '"0p', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", ",P", '"0P', { noremap = true, silent = true })

-- See lua/my/commands.lua
-- vim.api.nvim_set_keymap("n", "<F5>", ":ExecSh<cr>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<F6>", ":ExecVsh<cr>", { noremap = true, silent = true })
-- Close buffers with name "No name"
-- vim.api.nvim_set_keymap("n", "<F7>", [[:bdel! "No name"<cr>]], { noremap = true, silent = true })

-- Which-key: Quickfix
lvim.builtin.which_key.mappings["q"] = {
  name = "+QuickFix",
  o = { "<cmd>copen<cr>", "Open" },
  c = { "<cmd>cclose<cr>", "Close" },
  n = { "<cmd>cnext<cr>", "Next item" },
  p = { "<cmd>cprev<cr>", "Previous item" },
  f = { "<cmd>cfirst<cr>", "First item" },
  l = { "<cmd>clast<cr>", "Last item" },
  i = {
    function()
      local itemNr = vim.fn.input "QuickFix Item #"
      vim.cmd("cc" .. itemNr)
    end,
    "Item...",
  },
}

-- Which-key: +Search
lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope grep_string<cr>", "Grep cursor word" }
lvim.builtin.which_key.mappings["sG"] = { "<cmd>Telescope git_files<cr>", "Git files" }
-- Which-key: +Search Dash (if plugin is installed)
local status_ok, _ = pcall(require, "dash")
if status_ok then
  lvim.builtin.which_key.mappings["sd"] = { "<cmd>Dash<cr>", "Dash search" }
  lvim.builtin.which_key.mappings["sw"] = { "<cmd>DashWord<cr>", "Dash word" }
end

-- Which-key: +Git
lvim.builtin.which_key.mappings["gy"] = { "<cmd>lua require('gitlinker').get_buf_range_url('n')<cr>", "Gitlinker" }
-- Delta previewer custom Telescope functions
if vim.fn.executable "delta" == 1 then
  lvim.builtin.which_key.mappings["gS"] = {
    "<cmd>lua require('plugins.telescope').delta_git_status()<cr>",
    "Git status",
  }
  lvim.builtin.which_key.mappings["gL"] = {
    "<cmd>lua require('plugins.telescope').delta_git_commits()<cr>",
    "Git commits",
  }
  lvim.builtin.which_key.mappings["gM"] = {
    "<cmd>lua require('plugins.telescope').delta_git_bcommits()<cr>",
    "Git bcommits",
  }
end

-- Which-key: +Diagnostics
lvim.builtin.which_key.mappings["d"] = {
  name = "+Diagnotics (Trouble)",
  t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}

-- Which-key: +Sessions
lvim.builtin.which_key.mappings["S"] = {
  name = "+Sessions",
  s = { "<cmd>lua require('keymaps').save_session()<cr>", "Save" },
  o = { "<cmd>lua require('keymaps').open_session()<cr>", "Open" },
  r = { "<cmd>lua require('keymaps').remove_session()<cr>", "Remove" },
  l = { "<cmd>lua require('keymaps').list_sessions()<cr>", "List" },
}

-- Which-key: +Terminal
lvim.builtin.which_key.mappings["t"] = {
  name = "+Terminal",
  b = { "<cmd>split term://zsh<cr>", "Terminal to below" },
  r = { "<cmd>vsplit term://zsh<cr>", "Terminal to right" },
}

lvim.builtin.which_key.mappings["H"] = { "<cmd>noh<cr>", "No highlight" }

-- Which-key: +Harpoon
lvim.builtin.which_key.mappings["h"] = {
  name = "+Harpoon",
  a = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Navigate to file 1" },
  s = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Navigate to file 2" },
  d = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Navigate to file 3" },
  f = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Navigate to file 4" },
  h = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file" },
  t = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
  u = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Toggle UI" },
}

-- Which-key: LSP symbols
lvim.builtin.which_key.mappings["ls"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" }

-- Which-key: Zen-Mode
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" }

-- Which-key: Kitty config
lvim.builtin.which_key.mappings["K"] = { "<cmd>edit ~/.config/kitty/kitty.conf<cr>", "Kitty conf" }

-- Remove LunarVim keymaps
lvim.keys.visual_mode = {}
