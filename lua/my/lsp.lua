--
-- Set preferred linters and formatters
-- Set value to "" or nil to disable.
--
local lua_formatter = "stylua"
local lua_linter = "luacheck"
local prettier_exe = "prettier"
local eslint_exe = "eslint_d"
local sh_linter = "shellcheck"
local sh_formatter = "shfmt"
local cs_formatter = nil -- i.e. use OmniSharp language server
local css_linter = nil -- change to stylelint when supported
--
-- Does the current working directory (project) have a Prettier configuration?
--
local utils = require "my.utils"
local project_has_prettier_config = function()
  return (vim.fn.glob ".prettierrc*" ~= "" or utils.is_in_package_json "prettier")
end
--
-- Get JavaScript family formatters based on configuration
--
local get_js_formatters = function()
  local formatters = {}
  if eslint_exe ~= nil and eslint_exe ~= "" then
    local eslint_fix = { exe = eslint_exe }
    table.insert(formatters, eslint_fix)
  end
  if prettier_exe == nil or prettier_exe == "" then
    return formatters
  end
  if project_has_prettier_config() == true then
    local prettier_fmt = { exe = prettier_exe }
    table.insert(formatters, prettier_fmt)
  end
  return formatters
end
--
-- Lua formatter & linter
--
if lua_formatter ~= nil and lua_formatter ~= "" then
  lvim.lang.lua.formatters = { { exe = lua_formatter } }
end
if lua_linter ~= nil and lua_linter ~= "" then
  lvim.lang.lua.linters = { { exe = lua_linter } }
end
--
-- C# (cs) formatter. Note! Setting cs.formatter will disable language server (OmniSharp) formatting
--
if cs_formatter ~= nil and cs_formatter ~= "" then
  lvim.lang.cs.formatters = { { exe = cs_formatter } }
end
--
-- Setup formatters for JavaScript family
--
lvim.lang.javascript.formatters = get_js_formatters()
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.svelte.formatters = lvim.lang.javascript.formatters
lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.vue.formatters = lvim.lang.javascript.formatters

if prettier_exe ~= nil and prettier_exe ~= "" then
  lvim.lang.css.formatters = { { exe = prettier_exe } }
  lvim.lang.json.formatters = { { exe = prettier_exe } }
  lvim.lang.yaml.formatters = { { exe = prettier_exe } }
  lvim.lang.html.formatters = { { exe = prettier_exe } }
end
--
-- Setup linters for JavaScript family
--
if eslint_exe ~= nil and eslint_exe ~= "" then
  lvim.lang.javascript.linters = { { exe = eslint_exe } }
  lvim.lang.typescript.linters = lvim.lang.javascript.linters
  lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
  lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters
  lvim.lang.vue.linters = lvim.lang.javascript.linters
end
--
-- Linter for css/sass/scss/
--
if css_linter ~= nil and css_linter ~= "" then
  lvim.lang.css.linters = { { exe = css_linter } }
end
--
-- Setup shell/bash/zsh linter
--
if sh_linter ~= nil and sh_linter ~= "" then
  lvim.lang.sh.linters = { { exe = sh_linter } }
end
if sh_formatter ~= nil and sh_formatter ~= "" then
  lvim.lang.sh.formatters = { { exe = sh_formatter } }
end

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
