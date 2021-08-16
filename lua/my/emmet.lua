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
--[[
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
--]]

if not lspconfig.emmet_ls then
  configs.emmet_ls = {
    default_config = {
      cmd = { DATA_PATH .. "/lspinstall/emmet/node_modules/.bin/emmet-ls", "--stdio" },
      filetypes = {
        "aspnetcorerazor",
        "css",
        "django-html",
        "gohtml",
        "haml",
        "hbs",
        "html",
        "javascriptreact",
        "less",
        "php",
        "postcss",
        "razor",
        "sass",
        "scss",
        "svelte",
        "typescriptreact",
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
