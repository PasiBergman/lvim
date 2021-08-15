local utils = require "my.utils"
-- Skip configuring emmet language server client if project
-- does not look like a web project
if not utils.is_web_project() then
  return
end

local lspconfig = require "lspconfig"
local configs = require "lspconfig/configs"

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = { "emmet-ls", "--stdio" },
      filetypes = {
        "html",
        "css",
        "svelte",
        "typescriptreact",
        "javascriptreact",
        "vue",
      },
      root_dir = function(_)
        return vim.loop.cwd()
      end,
      settings = {},
    },
  }
end

lspconfig.emmet_ls.setup { capabilities = capabilities }
