--
-- Lualine configuration
--
require("user.plugins.lualine")

--
-- Additional plugins
--
lvim.plugins = {
	--
	-- Diagnostics
	--
	{
		"folke/trouble.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("user.plugins.trouble").config()
			local trouble = require("trouble.providers.telescope")

			lvim.builtin.telescope.defaults.mappings.i["<C-t>"] = trouble.open_with_trouble
			lvim.builtin.telescope.defaults.mappings.n["<C-t>"] = trouble.open_with_trouble
		end,
		event = "BufWinEnter",
		cmd = "TroubleToggle",
	},
	--
	-- The Primeagen: Harpoon
	{
		"ThePrimeagen/harpoon",
		config = function()
			require("user.plugins.harpoon").config()
		end,
		event = "BufWinEnter",
		requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
	},
	--
	-- Telescope
	--
	{
		"nvim-telescope/telescope-fzy-native.nvim",
	},
	--
	-- Themes
	--
	{
		"andersevenrud/nordic.nvim",
		config = function()
			require("user.themes.nordic").config()
		end,
		conditions = function()
			return lvim.colorscheme == "nordic"
		end,
	},
	{
		"Hoffs/omnisharp-extended-lsp.nvim",
	},
	{
		"PasiBergman/cmp-nuget",
		event = "BufWinEnter",
		config = function()
			local cmp_nuget = require("cmp-nuget")
			cmp_nuget.setup({})
			-- Insert 'nuget' source before 'buffer'
			table.insert(lvim.builtin.cmp.sources, 6, {
				name = "nuget",
				keyword_length = 0,
			})
			lvim.builtin.cmp.formatting.source_names["nuget"] = "[NuGet]"
		end,
	},
	{
		"David-Kunz/cmp-npm",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local cmp_npm = require("cmp-npm")
			cmp_npm.setup({})
			-- Insert 'npm' source before 'buffer'
			table.insert(lvim.builtin.cmp.sources, 7, {
				name = "npm",
				keyword_length = 3,
			})
			lvim.builtin.cmp.formatting.source_names["npm"] = "[NPM]"
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "BufRead",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	},
	--
	-- Github Copilot
	--
	{
		"github/copilot.vim",
		config = function()
			require("user.plugins.copilot").config_vim()
		end,
	},
}
