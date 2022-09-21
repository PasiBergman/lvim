-- SourceKit LSP executable
local sourcekit_opts = {
  cmd = { "sourcekit-lsp" },
}

-- Register Swift/SwiftUI/Objective-c language server
require("lvim.lsp.manager").setup("sourcekit", sourcekit_opts)

-- Add Apple's swift-format formatter to null-ls
local null_ls = require "null-ls"
local swift_format_args = { "format" }

-- Use project's swift-format coonfiguration file if found
local swift_format_config = vim.fn.glob ".swift-format"
if swift_format_config ~= "" then
  swift_format_args = vim.list_extend(swift_format_args, { "--configuration", swift_format_config })
end

null_ls.register {
  method = null_ls.methods.FORMATTING,
  name = "swift-format",
  meta = {
    url = "https://github.com/apple/swift-format",
    description = "swift-format provides the formatting technology for SourceKit-LSP and the building blocks for doing code formatting transformations.",
  },
  filetypes = { "swift" },
  generator = null_ls.generator {
    command = "swift-format",
    args = swift_format_args,
    to_stdin = true,
    on_output = function(params, done)
      local output = params.output
      if not output then
        return done()
      end

      return done { { text = output } }
    end,
  },
}
