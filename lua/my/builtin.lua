-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = false
lvim.builtin.nvimtree.setup.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.setup.hide_dotfiles = 0
lvim.builtin.nvimtree.setup.auto_close = 1
lvim.builtin.project.active = false

-- Disable debugging - using Vimspector for now
lvim.builtin.dap.active = false

-- Dashboard
lvim.builtin.dashboard.custom_section.b = {
  description = { "  Git files          " },
  command = "Telescope git_files",
}

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = {
  "haskell",
  "julia",
  "ledger",
  "ocaml",
  "ocaml_interface",
  "rst",
  "scala",
  "sparql",
  "supercollider",
  "swift",
  "teal",
  "toml",
  "turtle",
  "verilog",
  "zig",
}
lvim.builtin.treesitter.highlight.enabled = true
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

-- lualine
-- require "my.lualine"

-- Disable Sumneko Lua Language Server's telemetry
lvim.lang.lua.lsp.setup.settings.Lua["telemetry"] = { enable = false }

--
-- Tailwindcss
lvim.lang.tailwindcss.active = false
