--
-- Configure omnisharp only if C#/.NET solution or project is detected
--
if vim.fn.glob "*.sln" == "" and vim.fn.glob "*.csproj" == "" then
  return
end

lvim.lsp.installer.setup.ensure_installed = vim.list_extend(lvim.lsp.installer.setup.ensure_installed, { "omnisharp" })

local omnisharp_opts = {
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  organize_imports_on_format = true,
  sdk_include_prereleases = false,
  enable_roslyn_analyzers = true,
  analyze_open_documents_only = true,
}

require("lvim.lsp.manager").setup("omnisharp", omnisharp_opts)
