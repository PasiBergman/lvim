local lsp = require "lsp"
-- Only needed for the root_dir custom setup
local lsputil = require "lspconfig.util"
require("lspconfig").tailwindcss.setup {
  cmd = {
    "node",
    DATA_PATH .. "/lspinstall/tailwindcss/tailwindcss-intellisense/extension/dist/server/tailwindServer.js",
    "--stdio",
  },
  -- IMPORTANT
  -- Custom setup for root_dir is not typically needed
  -- In this case, I want to enable tailwindcss LS only on special cases
  -- and in this case root_dir is used to control the activation.
  root_dir = lsputil.root_pattern("tailwind.config.js", "postcss.config.ts", ".postcssrc"),
  on_attach = lsp.common_on_attach,
  on_init = lsp.common_on_init,
}
