lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "nordic"

-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Treesitter parsers
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"c_sharp",
	"css",
	"gitignore",
	"java",
	"javascript",
	"json",
	"lua",
	"python",
	"rust",
	"swift",
	"tsx",
	"typescript",
	"vue",
	"yaml",
	"comment",
	"dockerfile",
	"html",
	"java",
	"jsdoc",
	"json",
	"jsonc",
	"markdown",
	"r",
	"scss",
	"sql",
	"toml",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
