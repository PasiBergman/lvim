-- Which-key: Trouble
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
}

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
      local itemNr = vim.fn.input { "QuickFix Item #" }
      vim.cmd("cc" .. itemNr)
    end,
    "Item...",
  },
}

-- Which-key: +Search
lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope grep_string<cr>", "Grep cursor word" }
lvim.builtin.which_key.mappings["sG"] = { "<cmd>Telescope git_files<cr>", "Git files" }

-- Delta previewer custom Telescope functions
if vim.fn.executable "delta" == 1 then
  lvim.builtin.which_key.mappings["gS"] = {
    "<cmd>lua require('user.plugins.telescope').delta_git_status()<cr>",
    "Git status",
  }
  lvim.builtin.which_key.mappings["gL"] = {
    "<cmd>lua require('user.plugins.telescope').delta_git_commits()<cr>",
    "Git commits",
  }
  lvim.builtin.which_key.mappings["gM"] = {
    "<cmd>lua require('user.plugins.telescope').delta_git_bcommits()<cr>",
    "Git bcommits",
  }
end

local restartActiveLsp = function()
  local clients = vim.lsp.get_active_clients()
  for _, client in pairs(clients) do
    if client.name ~= "copilot" and client.name ~= "null-ls" then
      vim.schedule(function()
        local name = client.name
        local cmd = "LspRestart " .. client.id
        vim.cmd(cmd)
        print(cmd .. " (" .. name .. ") - completed.")
      end)
    end
  end
end

lvim.builtin.which_key.mappings["lR"] = { restartActiveLsp, "Restart LSPs" }

-- Which-key: +Sessions
lvim.builtin.which_key.mappings["S"] = {
  name = "+Sessions",
  s = { "<cmd>lua require('keymaps').save_session()<cr>", "Save" },
  o = { "<cmd>lua require('keymaps').open_session()<cr>", "Open" },
  r = { "<cmd>lua require('keymaps').remove_session()<cr>", "Remove" },
  l = { "<cmd>lua require('keymaps').list_sessions()<cr>", "List" },
}

-- Which-key: Move 'No highlight' to capital H as Harpoon will user lowercase h
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

-- Which-key: Kitty config
lvim.builtin.which_key.mappings["K"] = { "<cmd>edit ~/.config/kitty/kitty.conf<cr>", "Kitty conf" }
