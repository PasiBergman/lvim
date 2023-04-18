--
-- Use "omnisharp" or "csharp-language-server"
--
local csharp_ls = "omnisharp"
lvim.lsp.installer.setup.ensure_installed = vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { csharp_ls })

-- Configure omnisharp
if csharp_ls == "omnisharp" then
  local omnisharp_opts = {}
  local status_ok, omnisharp_extended = pcall(require, "omnisharp_extended")
  if status_ok then
    omnisharp_opts = {
      handlers = {
        ["textDocument/definition"] = omnisharp_extended.handler,
      },
      organize_imports_on_format = true,
      sdk_include_prereleases = false,
      enable_roslyn_analyzers = true,
      analyze_open_documents_only = true,
    }
  end
  require("lvim.lsp.manager").setup("omnisharp", omnisharp_opts)
  return
end

--
-- Omnisharp not used
--
lvim.lsp.automatic_configuration.skipped_servers =
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "omnisharp" })

local csharp_ls_opts = {}
require("lspconfig")["csharp_ls"].setup(csharp_ls_opts)
