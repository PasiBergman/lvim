local utils = require "user.utils"
-- Skip configuring emmet language server client if project
-- does not look like a Arduino project
if not utils.is_arduino_project() then
  return
end

local lspconfig = require "lspconfig"
-- local configs = require "lspconfig/configs"

--[[
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}
--]]

local arduino_lsp_path = "/Users/pasi/.local/share/nvim/lsp_servers/arduino_language_server/"

lspconfig.arduino_language_server.setup {
  cmd = {
    arduino_lsp_path .. "arduino-language-server/arduino-language-server",
    "-fqbn",
    "arduino:avr:uno",
    "-cli-config",
    "/Users/pasi/Library/Arduino15/arduino-cli.yaml",
    "-cli-daemon-addr",
    "127.0.0.1:50051",
    "-cli-daemon-instance",
    "1",
    "-cli",
    arduino_lsp_path .. "arduino-cli/arduino-cli",
    "-clangd",
    arduino_lsp_path .. "clangd/bin/clangd",
  },
  --[[ capabilities = capabilities, --]]
}
