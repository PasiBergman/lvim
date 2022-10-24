-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	formatting.eslint_d.with({
		condition = function(utils)
			return utils.root_has_file({
				".eslintrc",
				".eslintrc.js",
				"eslint.config.js",
				".eslintrc.cjs",
				".eslintrc.yaml",
				".eslintrc.yml",
				".eslintrc.json",
			})
		end,
	}),
	formatting.isort,
	formatting.prettier.with({
		condition = function(utils)
			return utils.root_has_file({
				".prettierrc",
				".prettierrc.json",
				".prettierrc.yml",
				".prettierrc.yaml",
				".prettierrc.json5",
				".prettierrc.js",
				".prettierrc.cjs",
				".prettierrc.config.js",
				".prettierrc.config.cjs",
				".prettierrc.toml",
			})
		end,
		prefer_local = "node_modules/.bin",
	}),
	formatting.shfmt,
	formatting.stylua,
})
