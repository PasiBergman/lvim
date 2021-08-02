-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

-- keymappings
lvim.leader = "space"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.nvimtree.auto_close = 1

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
lvim.builtin.telescope.defaults.layout_strategy = "vertical"
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 90
lvim.builtin.telescope.defaults.layout_config.width = 0.80

-- Additional Plugins
require "my.plugins"

-- Key mappings and which-key
require "my.keymaps"

-- LSP
require "my.lsp"

-- Autocommands
require "my.autocommands"

-- Additional JSON schemas
require("my.json-schemas").setup()
