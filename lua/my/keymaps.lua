-- Yank to line end
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })
-- Keep centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
-- Undo break points
vim.api.nvim_set_keymap("n", ".", ".<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",", ",<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "!", "!<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "?", "?<C-g>u", { noremap = true, silent = true })
-- Move text
vim.api.nvim_set_keymap("v", "J", "'>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", "'<-2<CR>gv=gv", { noremap = true, silent = true })

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

lvim.builtin.which_key.mappings["L"] = {
  name = "+Location list",
  o = { "<cmd>lopen<cr>", "Open" },
  c = { "<cmd>lclose<cr>", "Close" },
  n = { "<cmd>lnext<cr>", "Next item" },
  p = { "<cmd>lprev<cr>", "Previous item" },
  f = { "<cmd>lfirst<cr>", "First item" },
  l = { "<cmd>llast<cr>", "Last item" },
  i = {
    function()
      local itemNr = vim.fn.input "Loclist item# "
      vim.cmd("ll" .. itemNr)
    end,
    "Item...",
  },
}

lvim.builtin.which_key.mappings["sg"] = { "<cmd>Telescope grep_string<cr>", "Grep cursor word" }

lvim.builtin.which_key.mappings["d"] = {
  name = "+Diagnotics",
  t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "+Sessions",
  s = { "<cmd>lua require('my.keymaps').save_session()<cr>", "Save" },
  o = { "<cmd>lua require('my.keymaps').open_session()<cr>", "Open" },
  r = { "<cmd>lua require('my.keymaps').remove_session()<cr>", "Remove" },
  l = { "<cmd>lua require('my.keymaps').list_sessions()<cr>", "List" },
}
-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- lvim.builtin.which_key.mappings[]
--   Page down/up
--   {'[d', '<PageUp>'},
--   {']d', '<PageDown>'},
--
--   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
-- }
-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.cs", "setlocal ts=4 sw=4" },
-- }

M = {}

M.save_session = function()
  local name = vim.fn.input "Save session: "
  if name ~= "" then
    local command = "mksession! ~/.cache/nvim/sessions/" .. name
    vim.cmd(command)
    vim.cmd('echo "Session ' .. name .. ' saved."')
  end
end

M.open_session = function()
  local name = vim.fn.input "Open session: "
  if name ~= "" then
    local command = "source ~/.cache/nvim/sessions/" .. name
    vim.cmd(command)
    vim.cmd('echo "Session ' .. name .. ' sourced."')
  end
end

M.remove_session = function()
  local name = vim.fn.input "Delete session: "
  if name ~= "" then
    local command = "!rm ~/.cache/nvim/sessions/" .. name
    vim.cmd(command)
    vim.cmd('echo "Session ' .. name .. ' removed."')
  end
end

M.list_sessions = function()
  local command = "!ls ~/.cache/nvim/sessions/ | xargs"
  vim.cmd(command)
end

return M
