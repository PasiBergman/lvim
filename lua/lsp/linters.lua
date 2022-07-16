-- Configure linters manually
local linters = require "lvim.lsp.null-ls.linters"

local linters_table = {
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
    command = "shellcheck",
    filetypes = {
      "sh",
      "shell",
      "bash",
      "zsh",
    },
  },
  {
    command = "stylelint",
    filetypes = {
      "css",
      "scss",
      "sass",
    },
  },
  {
    command = "luacheck",
    filetypes = {
      "lua",
    },
  },
  {
    command = "markdownlint",
    filetype = {
      "markdown",
    },
  },
  {
    command = "flake8",
    filetype = {
      "python",
    },
  },
  {
    command = "write-good",
    filetype = {
      "markdown",
    },
  },
}

linters.setup(linters_table)
