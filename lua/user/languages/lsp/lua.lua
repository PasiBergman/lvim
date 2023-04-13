local lua_ls = "lua_ls"

lvim.lsp.automatic_configuration.skipped_servers =
  vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { lua_ls })

-- Additionl configuration for lua_ls
-- See also:
-- https://github.com/LunarVim/LunarVim/blob/master/lua/lvim/lsp/providers/lua_ls.lua#L45
local lua_ls_opts = {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
      },
    },
  },
}

-- Configure lua_ls together with the LunarVim lua_ls configuration
require("lvim.lsp.manager").setup(lua_ls, lua_ls_opts)
