--
-- Lualine configuration
--
require "user.plugins.lualine"
--
-- Disable autopairs
lvim.builtin.autopairs.active = false

--
-- Additional plugins
--
lvim.plugins = {
  --
  -- Motion: Hop
  --
  {
    "phaazon/hop.nvim",
    branch = "v2",
    event = "BufRead",
    config = function()
      require("user.plugins.hop").config()
    end,
  },
  --
  -- Diagnostics
  --
  {
    "folke/trouble.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("user.plugins.trouble").config()
    end,
    event = "BufWinEnter",
    cmd = "TroubleToggle",
  },
  --
  -- The Primeagen: Harpoon
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("user.plugins.harpoon").config()
    end,
    event = "BufWinEnter",
    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
  },
  --
  -- Themes
  --
  {
    "andersevenrud/nordic.nvim",
    config = function()
      require("user.themes.nordic").config()
    end,
    conditions = function()
      return lvim.colorscheme == "nordic"
    end,
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  {
    "PasiBergman/cmp-nuget",
    event = "BufWinEnter",
    config = function()
      local cmp_nuget = require "cmp-nuget"
      cmp_nuget.setup {}
      -- Insert 'nuget' source before 'buffer'
      table.insert(lvim.builtin.cmp.sources, 6, {
        name = "nuget",
        keyword_length = 0,
      })
      lvim.builtin.cmp.formatting.source_names["nuget"] = "[NuGet]"
    end,
  },
  {
    "David-Kunz/cmp-npm",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local cmp_npm = require "cmp-npm"
      cmp_npm.setup {}
      -- Insert 'npm' source before 'buffer'
      table.insert(lvim.builtin.cmp.sources, 7, {
        name = "npm",
        keyword_length = 3,
      })
      lvim.builtin.cmp.formatting.source_names["npm"] = "[NPM]"
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("user.plugins.todo-comments").config()
    end,
  },
  --
  -- Github Copilot
  --
  {
    "github/copilot.vim",
    config = function()
      require("user.plugins.copilot").config_vim()
    end,
  },
  --
  -- LSP Overloads Nvim
  -- Native LSP signatureHelper handler doesn't provide an easy way to view all
  -- the possible overloads and parameter details for signatures
  --
  -- See lua/users/lsp/init.lua for configuration
  {
    event = "BufRead",
    "Issafalcon/lsp-overloads.nvim",
  },
  --
  -- fidget.nvim: Standalone UI for nvim-lsp progress.
  --[[
  {
    "j-hui/fidget.nvim",
    event = "BufRead",
    config = function()
      require("fidget").setup {}
    end,
  },
  --]]
  -- Undotree
  --
  {
    "mbbill/undotree",
    event = "BufRead",
    config = function()
      vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
  },
  --
  -- EditorConfig support
  --
  {
    "gpanders/editorconfig.nvim",
    event = "BufRead",
    --[[
    config = function()
      -- Custom properties can be added through the properties table:
      require('editorconfig').properties.foo = function(bufnr, val)
        vim.b[bufnr].foo = val
      end
    end,
    --]]
  },
}
