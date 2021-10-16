--
-- Activate LunarVim tailwindcss lsp configuration only
-- if project seems to have a tailwindcss dependency
--
local utils = require "my.utils"
local project_has_tailwindcss_dependency = function()
  return (vim.fn.glob "tailwind*" ~= "" or utils.is_in_package_json "tailwindcss")
end

lvim.lang.tailwindcss.active = project_has_tailwindcss_dependency()

--[[
local utils = require "my.utils"
local project_has_tailwinds_dependency = function()
  return (vim.fn.glob "tailwind*" ~= "" or utils.is_in_package_json "tailwindcss")
end

if not project_has_tailwinds_dependency() then
  return
end

local lsp = require "lsp"
require("lspconfig").tailwindcss.setup {
  cmd = {
    "node",
    DATA_PATH .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/tailwindServer.js",
    "--stdio",
  },
  on_attach = lsp.common_on_attach,
  on_init = lsp.common_on_init,
}
--]]
