local Copilot = {}

local copilot_hl_func = function()
  vim.api.nvim_set_hl(0, "CopilotSuggestion", { fg = "#888888" })
end

--
-- Config for github/copilot.vim
--
Copilot.config_vim = function()
  -- disable cmp's ghost text override
  lvim.builtin.cmp.experimental.ghost_text = false

  vim.g.copilot_filetypes = { xml = false, markdown = false }
  -- vim.g.copilot_filetypes = { ["*"] = false, python = true, java = true }

  vim.g.copilot_no_tab_map = true
  vim.api.nvim_set_keymap("i", "<C-a>", 'copilot#Accept("\\<CR>")', { silent = true, expr = true })
  vim.api.nvim_set_keymap("i", "<C-k>", "copilot#Previous()", { silent = true, expr = true })
  vim.api.nvim_set_keymap("i", "<C-j>", "copilot#Next()", { silent = true, expr = true })
  vim.api.nvim_set_keymap("i", "<C-d>", "copilot#Dismiss()", { silent = true, expr = true })
  vim.defer_fn(copilot_hl_func, 1000)
end

return Copilot
