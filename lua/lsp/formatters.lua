-- Configure formatters manually
local formatters = require "lvim.lsp.null-ls.formatters"
local utils = require "utils"

local prettier_filetypes = {
  "html",
  "json",
  "markdown",
  "yaml",
}

-- If the current working directory (project) has a Prettier configuration,
-- then use prettier for TypeScript, JavaScript, Vue, React etc file formatting.
if utils.project_has_prettier_config() == true then
  prettier_filetypes = {
    "css",
    "scss",
    "sass",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "markdown",
    "svelte",
    "typescript",
    "typescriptreact",
    "vue",
    "yaml",
  }
end

local formatters_table = {
  {
    command = "stylua",
    filetypes = {
      "lua",
    },
  },
  {
    command = "eslint_d",
    filetypes = {
      "javascript",
      "javascriptreact",
      "svelte",
      "typescript",
      "typescriptreact",
      "vue",
    },
  },
  {
    command = "shfmt",
    filetypes = {
      "sh",
      "shell",
      "bash",
      "zsh",
    },
  },
  {
    command = "black",
    args = { "--fast" },
    filetypes = {
      "python",
    },
  },
  {
    command = "isort",
    args = { "--profile", "black" },
    filetypes = {
      "python",
    },
  },
  {
    command = "prettier",
    filetypes = prettier_filetypes,
  },
  --[[
  -- Using swift-format instead of swiftformat
  -- See ./lua/lsp/sourcekit.lua
  {
    command = "swiftformat",
    filetype = {
      "swift",
    },
  },
  --]]
}

formatters.setup(formatters_table)
