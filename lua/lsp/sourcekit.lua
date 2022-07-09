local sourcekit_opts = {
  cmd = { "sourcekit-lsp" },
}

require("lvim.lsp.manager").setup("sourcekit", sourcekit_opts)
