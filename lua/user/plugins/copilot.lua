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

Copilot.config_lua = function()
  local result_ok, copilot = pcall(require, "copilot")
  if not result_ok then
    return
  end

  copilot.setup {
    panel = {
      enabled = true,
      auto_refresh = false,
      keymap = {
        jump_prev = "<C-j>",
        jump_next = "<C-k>",
        accept = "<C-a>",
        refresh = "gr",
        open = "<C-CR>",
      },
    },
    suggestion = {
      enabled = true,
      auto_trigger = true,
      debounce = 75,
      keymap = {
        accept = "<C-a>",
        accept_word = false,
        accept_line = false,
        next = "<C-j>",
        prev = "<C-k>",
        dismiss = "<C-d>",
      },
    },
    filetypes = {
      yaml = false,
      markdown = false,
      help = false,
      gitcommit = false,
      gitrebase = false,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
    copilot_node_command = "node", -- Node.js version must be > 16.x
    server_opts_overrides = {},
  }
end

return Copilot
