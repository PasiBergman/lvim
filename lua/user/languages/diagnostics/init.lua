-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local null_ls = require "null-ls"
local diagnostics = null_ls.builtins.diagnostics
local user_utils = require "user.utils"

local config_file_names_eslint = require("user.languages.config-file-names").eslint

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  diagnostics.eslint_d.with {
    condition = function(nls_utils)
      return nls_utils.root_has_file(config_file_names_eslint) or user_utils.is_in_package_json "eslint"
    end,
  },
  diagnostics.commitlint,
  diagnostics.flake8,
  diagnostics.jsonlint,
  diagnostics.luacheck,
  diagnostics.markdownlint,
  diagnostics.shellcheck,
  diagnostics.stylelint,
  diagnostics.yamllint,
  diagnostics.zsh,
}

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--severity", "warning" },
--   },
--   {
--     command = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }
