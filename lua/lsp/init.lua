vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "omnisharp" })

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
-- Do not install langauge servers automatically
lvim.lsp.automatic_servers_installation = false

-- Configure formatters and linters manually
local linters = require "lvim.lsp.null-ls.linters"
local formatters = require "lvim.lsp.null-ls.formatters"
--
-- Does the current working directory (project) have a Prettier configuration?
--
local utils = require "utils"
local project_has_prettier_config = function()
  local hasprettier = (
    vim.fn.glob ".prettierrc*" ~= ""
    or vim.fn.glob "prettier.*" ~= ""
    or utils.is_in_package_json "prettier"
  )
  -- print("Project does has prettier configured? " .. tostring(hasprettier))
  return hasprettier
end

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

if project_has_prettier_config() == true then
  table.insert(formatters_table, {
    command = "prettier",
    filetypes = {
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
    },
  })
else
  table.insert(formatters_table, {
    command = "prettier",
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
