--
-- IMPORTANT!
-- When configuration vetur/volar is not automatically detected, execute
-- :LvimCacheRest and :PackerCompile commands to update the configuraton.
--
-- Recognize older Vue <2.7 projects by adding a .vetur file to the project's root
-- If project root doesn't have .vetur file, configure volar
if vim.fn.glob ".vetur*" == "" then
  lvim.lsp.installer.setup.ensure_installed = vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "volar" })
  return
end
--
-- .vetur file found -> configure old vetur language server
lvim.lsp.installer.setup.ensure_installed = vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "vuels" })
lvim.lsp.automatic_configuration.skipped_servers =
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "volar" })

local vetur_opts = {
  cmd = { vim.fn.expandcmd "$HOME/.local/share/nvim/mason/bin/vls" },
  filetypes = { "vue" },
}

require("lvim.lsp.manager").setup("vuels", vetur_opts)
