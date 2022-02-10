-- Format buffer when buffer/file is saved
lvim.format_on_save = true

-- Theme/Colorscheme
lvim.colorscheme = "nordic"

-- Leader key
lvim.leader = "space"

-- Keymap timeout
vim.go.timeoutlen = 500

-- Relative row numbers
vim.go.relativenumber = true

-- Debug LunarVim
lvim.debug = false

-- kitty
-- https://sw.kovidgoyal.net/kitty/faq/#some-special-symbols-are-rendered-small-truncated-in-kitty
vim.cmd [[let &t_ut='']]

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = false
-- Disable floating terminal - using tmux instead
lvim.builtin.terminal.active = false
-- Disable debugging - using Vimspector for now
lvim.builtin.dap.active = false

lvim.builtin.telescope.extensions = {
  fzy_native = {
    override_generic_sorter = false,
    override_file_sorter = true,
  },
}
lvim.builtin.telescope.on_config_done = function()
  require("telescope").load_extension "fzy_native"
end
lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 80
lvim.builtin.telescope.defaults.layout_config.width = 0.95
local actions = require "telescope.actions"
local mappings = {
  i = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-c>"] = actions.close,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    ["<CR>"] = actions.select_default + actions.center,
  },
  n = {
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selection_previous,
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
  },
}
lvim.builtin.telescope.defaults.mappings = mappings

-- lvim.builtin.treesitter.playground.enable = true
