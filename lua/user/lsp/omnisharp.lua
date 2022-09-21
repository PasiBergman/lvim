vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "omnisharp" })

local omnisharp_opts = {
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
}

require("lvim.lsp.manager").setup("omnisharp", omnisharp_opts)
