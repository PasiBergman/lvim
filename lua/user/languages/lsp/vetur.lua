--
-- Configuring Vetur instead of Volar
--
-- lvim.lsp.automatic_configuration.skipped_servers =
--  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "volar" })
lvim.lsp.automatic_configuration.skipped_filetypes =
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_filetypes, { "vue" })

local vetur_opts = {
  cmd = { "/Users/pasi/.local/share/nvim/mason/bin/vls" },
  filetypes = { "vue" },
}

require("lvim.lsp.manager").setup("vuels", vetur_opts)
