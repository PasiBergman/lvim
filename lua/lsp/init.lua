-- Arduino
require "lsp.arduino"
-- Emmet LS
require "lsp.emmet"
-- Omnisharp/C#
require "lsp.omnisharp"
-- Tailwindcss
require "lsp.tailwindcss"
-- Sourcekit / Swift / SwiftUI / Objective-C
require "lsp.sourcekit"
--
require "lsp.null-ls.formatters"
--
require "lsp.null-ls.linters"
--
-- Do not install langauge servers automatically
lvim.lsp.automatic_servers_installation = false

-- Disable formatting capability of tsserver and jsonls
-- as we use prettier and/or eslint_d to format/fix
lvim.lsp.on_attach_callback = function(client, _)
  if client.name ~= "tsserver" and client.name ~= "jsonls" then
    return
  end

  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end
