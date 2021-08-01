-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "spacegray"

-- keymappings
lvim.leader = "space"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.nvimtree.auto_close = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = {
  "haskell",
  "julia",
  "ledger",
  "ocaml",
  "ocaml_interface",
  "rst",
  "scala",
  "sparql",
  "supercollider",
  "swift",
  "teal",
  "toml",
  "turtle",
  "verilog",
  "zig",
}
lvim.builtin.treesitter.highlight.enabled = true

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

-- Additional Plugins
lvim.plugins = {
  -- { "folke/tokyonight.nvim" },
  -- { 'projekt0n/github-nvim-theme' },
  -- { "rafamadriz/neon" },
  {
    "rizzatti/dash.vim",
    event = "BufWinEnter",
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
    event = "BufWinEnter",
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup()
    end,
    event = "InsertEnter",
  },
  {
    "phaazon/hop.nvim",
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
}

--
-- Setup formatters for JavaScript family
--
lvim.lang.javascript.formatters = {
  {
    exe = "eslint_d",
    args = lvim.lang.javascript.formatters[1].args,
  },
}
lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.vue.formatters = lvim.lang.javascript.formatters
--
-- Setup linters for JavaScript family
--
lvim.lang.javascript.linters = { { exe = "eslint_d" } }
lvim.lang.typescript.linters = lvim.lang.javascript.linters
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters
lvim.lang.vue.linters = lvim.lang.javascript.linters
--
-- Setup shell/bash/zsh linter
--
lvim.lang.sh.linters = { { exe = "shellcheck" } }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.cs", "setlocal ts=4 sw=4" },
-- }

-- Yank to line end
vim.api.nvim_set_keymap("n", "Y", "y$", { noremap = true, silent = true })
-- Keep centered
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = true })
-- Undo break points
vim.api.nvim_set_keymap("n", ".", ".<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",", ",<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "!", "!<C-g>u", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "?", "?<C-g>u", { noremap = true, silent = true })
-- Move text
vim.api.nvim_set_keymap("v", "J", "'>+1<CR>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "K", "'<-2<CR>gv=gv", { noremap = true, silent = true })

lvim.builtin.which_key.mappings["q"] = {
  name = "+QuickFix",
  o = { "<cmd>copen<cr>", "Open" },
  c = { "<cmd>cclose<cr>", "Close" },
  n = { "<cmd>cnext<cr>", "Next item" },
  p = { "<cmd>cprev<cr>", "Previous item" },
  f = { "<cmd>cfirst<cr>", "First item" },
  l = { "<cmd>clast<cr>", "Last item" },
  i = {
    function()
      local itemNr = vim.fn.input "QuickFix Item #"
      vim.cmd("cc" .. itemNr)
    end,
    "Item...",
  },
}

lvim.builtin.which_key.mappings["L"] = {
  name = "+Location list",
  o = { "<cmd>lopen<cr>", "Open" },
  c = { "<cmd>lclose<cr>", "Close" },
  n = { "<cmd>lnext<cr>", "Next item" },
  p = { "<cmd>lprev<cr>", "Previous item" },
  f = { "<cmd>lfirst<cr>", "First item" },
  l = { "<cmd>llast<cr>", "Last item" },
  i = {
    function()
      local itemNr = vim.fn.input "Loclist item# "
      vim.cmd("ll" .. itemNr)
    end,
    "Item...",
  },
}

lvim.builtin.which_key.mappings["d"] = {
  name = "+Diagnotics",
  t = { "<cmd>TroubleToggle<cr>", "Toggle Trouble" },
  w = { "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", "Workspace" },
  d = { "<cmd>TroubleToggle lsp_document_diagnostics<cr>", "Document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "Loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
}

-- overwrite the key-mappings provided by LunarVim for any mode, or leave it empty to keep them
-- lvim.builtin.which_key.mappings[]
--   Page down/up
--   {'[d', '<PageUp>'},
--   {']d', '<PageDown>'},
--
--   Navigate buffers
--   {'<Tab>', ':bnext<CR>'},
--   {'<S-Tab>', ':bprevious<CR>'},
-- }
-- if you just want to augment the existing ones then use the utility function
-- require("utils").add_keymap_insert_mode({ silent = true }, {
-- { "<C-s>", ":w<cr>" },
-- { "<C-c>", "<ESC>" },
-- })

-- Additional JSON schemas
require("my.json-schemas").setup()
