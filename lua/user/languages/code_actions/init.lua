-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local null_ls = require "null-ls"
local cas = null_ls.builtins.code_actions

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  cas.eslint_d.with {
    condition = function(utils)
      return utils.root_has_file {
        ".eslintrc",
        ".eslintrc.js",
        "eslint.config.js",
        ".eslintrc.cjs",
        ".eslintrc.yaml",
        ".eslintrc.yml",
        ".eslintrc.json",
      }
    end,
  },
  cas.gitsigns,
  cas.shellcheck,
}
