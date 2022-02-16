-- Emmet LS
require "lsp.emmet"
-- Tailwindcss
require "lsp.tailwindcss"
-- Arduino
require "lsp.arduino"
-- Vue
-- require "lsp.vuels"
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
local utils = require "utils"
local project_has_prettier_config = function()
  local hasprettier = (vim.fn.glob ".prettierrc*" ~= "" or utils.is_in_package_json "prettier")
  -- print("Project does has prettier configured? " .. tostring(hasprettier))
  return hasprettier
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
      "markdown",
    },
  },
  {
    exe = "flake8",
    filetype = {
      "python",
    },
  },
  {
    exe = "write-good",
    filetype = {
      "markdown",
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
      "python",
    },
  },
  {
    exe = "isort",
    args = { "--profile", "black" },
    filetypes = {
      "python",
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

-- Disable formatting capability of tsserver and jsonls
-- as we use prettier and/or eslint_d to format/fix
lvim.lsp.on_attach_callback = function(client, _)
  if client.name ~= "tsserver" and client.name ~= "jsonls" then
    return
  end

  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
end
