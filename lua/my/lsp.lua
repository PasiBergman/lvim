--
-- Set preferred linters and formatters
--
local lua_formatter = "stylua"
local lua_linter = "luacheck"
local cs_formatter = nil -- i.e. use OmniSharp language server
local prettier = "prettier"
local js_linter = "eslint_d"
local css_linter = "stylelint" -- stylelint not supported yet
local sh_linter = "shellcheck"
--
-- Does package.json file contain speficied configuration or dependency?
-- (e.g. "prettier")
--
local in_package_json = function(field)
  if vim.fn.filereadable(vim.fn.getcwd() .. "/package.json") ~= 0 then
    local package_json = vim.fn.json_decode(vim.fn.readfile "package.json")
    if package_json[field] ~= nil then
      return true
    end
    local dev_dependencies = package_json["devDependencies"]
    if dev_dependencies[field] ~= nil then
      return true
    end
    local dependencies = package_json["dependencies"]
    if dependencies[field] ~= nil then
      return true
    end
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
  if js_linter ~= nil and js_linter ~= "" then
    local eslint_fix = { exe = js_linter }
    table.insert(formatters, eslint_fix)
  end
  if prettier == nil or prettier == "" then
    return formatters
  end
  if project_has_prettier_config() == true then
    print "Adding prettier"
    local prettier_fmt = { exe = prettier }
    table.insert(formatters, prettier_fmt)
  else
    print "Not adding prettier"
  end
  return formatters
end
--
-- Lua formatter & linter
--
lvim.lang.lua.formatters = { { exe = lua_formatter } }
if lua_linter ~= "" then
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
