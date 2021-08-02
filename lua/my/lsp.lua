--
-- Setup formatters for JavaScript family
--
lvim.lang.javascript.formatters = {
  {
    exe = "eslint_d",
    args = lvim.lang.javascript.formatters[1].args,
  },
}
lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.vue.formatters = lvim.lang.javascript.formatters
--
-- Setup linters for JavaScript family
--
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.typescript.linters = lvim.lang.javascript.linters
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters
lvim.lang.vue.linters = lvim.lang.javascript.linters
--
-- Setup shell/bash/zsh linter
--
lvim.lang.sh.linters = { { exe = "shellcheck" } }

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
