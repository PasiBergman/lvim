-- make sure server will always be installed even if the server is in skipped_servers list
lvim.lsp.automatic_servers_installation = false
lvim.lsp.installer.setup.ensure_installed = {
  "bashls",
  "bicep",
  "jsonls",
  "pyright",
  "sumneko_lua",
  "tsserver",
}

-- OmniSharp custom configuration
require "user.languages.lsp.omnisharp"
-- Vue custom configuration
require "user.languages.lsp.vue"
-- Emmet ls custom configuration
require "user.languages.lsp.emmetls"

-- Setup lsp-overloads if plugin is installed
lvim.lsp.on_attach_callback = function(client, _)
  if client.server_capabilities.signatureHelpProvider then
    local status_ok, lsp_overloads = pcall(require, "lsp-overloads")
    if not status_ok then
      return
    end
    -- https://github.com/Issafalcon/lsp-overloads.nvim#configuration
    lsp_overloads.setup(client, {
      -- Defaults
      keymaps = {
        next_signature = "<C-j>",
        previous_signature = "<C-k>",
        next_parameter = "<C-l>",
        previous_parameter = "<C-h>",
      },
    })
  end
end

-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
