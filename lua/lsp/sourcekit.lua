-- SourceKit LSP executable
local sourcekit_opts = {
  cmd = { "sourcekit-lsp" },
}

-- Register Swift/SwiftUI/Objective-c language server
require("lvim.lsp.manager").setup("sourcekit", sourcekit_opts)

-- Add swift-format formatter to null-ls
local null_ls = require "null-ls"

local swift_format_formatter = {
  method = null_ls.methods.FORMATTING,
  name = "swift-format",
  meta = {
    url = "https://github.com/apple/swift-format",
    description = "swift-format provides the formatting technology for SourceKit-LSP and the building blocks for doing code formatting transformations.",
  },
  filetypes = { "swift" },
  generator = null_ls.generator {
    command = "swift-format",
    args = { "format" },
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

require("null-ls").register(swift_format_formatter)

--[[
local helpers = require "null-ls.helpers"

local swift_format_linter = {
  method = null_ls.methods.DIAGNOSTICS,
  name = "swift-format",
  meta = {
    url = "https://github.com/apple/swift-format",
    description = "swift-format provides the formatting technology for SourceKit-LSP and the building blocks for doing code formatting transformations.",
  },
  filetypes = { "swift" },
  generator = null_ls.generator {
    command = "swift-format",
    args = { "lint", "--assume-filename", "$FILENAME" },
    to_stdin = true,
    from_stderr = true,
    format = "line",
    check_exit_code = function(code, stderr)
      local success = code <= 1
      if not success then
        return success, "swift-format lint failed with exit code " .. code .. ". stderr: " .. stderr
      end
      return success
    end,
    on_output = helpers.diagnostics.from_patterns {
      {
        pattern = ".*:(%d+):(%d+): (%w+): [(%w+)] (.*)",
        groups = { "row", "col", "severity", "code", "message" },
      },
    },
  },
}

require("null-ls").register(swift_format_linter)
--]]
