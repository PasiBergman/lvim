--
-- Configure Emmet language server if project is a web project.
-- Web project is detected by package.json file and *.js/*.ts files.
-- Add other files if needed.
--
if vim.fn.glob "package.json" == "" and vim.fn.glob "*.js" == "" and vim.fn.glob "*.ts" == "" then
  return
end

lvim.lsp.installer.setup.ensure_installed = vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "emmet_ls" })

local emmetls_opts = {
  cmd = { vim.fn.expandcmd "$HOME/.local/share/nvim/mason/bin/emmet-ls", "--stdio" },
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby", "vue", "astro" },
}

require("lvim.lsp.manager").setup("emmet_ls", emmetls_opts)
