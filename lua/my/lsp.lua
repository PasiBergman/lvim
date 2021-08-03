--
-- Set preferred linters and formatters
--
local lua_formatter = "stylua"
local prettier = "prettier"

local js_linter = "eslint_d"
local css_linter = "stylelint" -- stylelint not supported yet
local sh_linter = "shellcheck"

local use_eslint_fix = true
--
-- Does package.json file contain speficied configuration (e.g. "prettier")?
--
local in_package_json = function(field)
  if vim.fn.filereadable "package.json" ~= 0 then
    local package_json = vim.fn.json_decode(vim.fn.readfile "package.json")
    return (package_json[field] ~= nil)
  end
  return false
end
--
-- Does the current working directory (project) have a Prettier configuration?
--
local project_has_prettier_config = function()
  return (vim.fn.glob ".prettierrc*" ~= "" or in_package_json "prettier")
end
--
-- Get JavaScript family formatters based on configuration
--
local get_js_formatters = function()
  local formatters = {}
  local eslint_fix = {
    exe = js_linter,
    args = {},
  }
  if js_linter == "eslint_d" and use_eslint_fix == true then
    table.insert(formatters, eslint_fix)
  end
  if project_has_prettier_config() == true then
    local prettier_fmt = {
      exe = prettier,
      args = {},
    }
    table.insert(formatters, prettier_fmt)
  end
  return formatters
end
--
-- Lua formatter
--
lvim.lang.lua.formatters = {
  {
    exe = lua_formatter,
    args = {},
  },
}
--
-- Setup formatters for JavaScript family
--
lvim.lang.javascript.formatters = get_js_formatters()
lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.vue.formatters = lvim.lang.javascript.formatters
lvim.lang.css.formatters = { { exe = prettier, args = {} } }
--
-- Setup linters for JavaScript family
--
lvim.lang.javascript.linters = { { exe = js_linter } }
lvim.lang.typescript.linters = lvim.lang.javascript.linters
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters
lvim.lang.vue.linters = lvim.lang.javascript.linters
--
-- Linter for css/sass/scss/
--
lvim.lang.css.linters = { { exe = css_linter } }
--
-- Setup shell/bash/zsh linter
--
lvim.lang.sh.linters = { { exe = sh_linter } }

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
