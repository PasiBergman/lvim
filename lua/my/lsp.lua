--
-- Do not install langauge servers automatically
--
lvim.lsp.automatic_servers_installation = false

-- Configure formatters and linters manually
local linters = require "lvim.lsp.null-ls.linters"
local formatters = require "lvim.lsp.null-ls.formatters"
--
-- Does the current working directory (project) have a Prettier configuration?
--
local utils = require "my.utils"
local project_has_prettier_config = function()
  return (vim.fn.glob ".prettierrc*" ~= "" or utils.is_in_package_json "prettier")
end

local linters_table = {
  {
    exe = "eslint_d",
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
    exe = "shellcheck",
    filetypes = {
      "sh",
      "shell",
      "bash",
      "zsh",
    },
  },
  {
    exe = "stylelint",
    filetypes = {
      "css",
      "scss",
    },
  },
  {
    exe = "luacheck",
    filetypes = {
      "lua",
    },
  },
  {
    exe = "markdownlint",
    filetype = {
      "md",
    },
  },
  {
    exe = "flake8",
    filetype = {
      "py",
    },
  },
}

local formatters_table = {
  {
    exe = "stylua",
    filetypes = {
      "lua",
    },
  },
  {
    exe = "eslint_d",
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
    exe = "shfmt",
    filetypes = {
      "sh",
      "shell",
      "bash",
      "zsh",
    },
  },
  {
    exe = "black",
    args = { "--fast" },
    filetypes = {
      "py",
    },
  },
  {
    exe = "isort",
    args = { "--profile", "black" },
    filetypes = {
      "py",
    },
  },
}

if project_has_prettier_config() == true then
  table.insert(formatters_table, {
    exe = "prettier",
    filetypes = {
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
    },
  })
else
  table.insert(formatters_table, {
    exe = "prettier",
    filetypes = {
      "html",
      "json",
      "markdown",
      "yaml",
    },
  })
end

formatters.setup(formatters_table)
linters.setup(linters_table)
