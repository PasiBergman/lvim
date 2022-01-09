-- ==================
-- LunarVim built-in
-- ==================
--
-- Dasboard
require("plugins.dashboard").config()
-- Lualine
require("plugins.lualine").config()
-- Nvim-tree
require("plugins.nvim-tree").config()
-- Debug (DAP)
require("plugins.dap").config()
-- Treesitter
require("plugins.treesitter").config()
-- Barbar
require("plugins.barbar").config()
--
-- ==================
-- Additional plugins
-- ==================
--
lvim.plugins = {
  --
  -- Debug
  --
  {
    "puremourning/vimspector",
    config = function()
      require("plugins.vimspector").config()
    end,
  },
  --
  -- Diagnostics
  --
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("plugins.trouble").config()
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
  --
  -- Git
  --
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("plugins.gitlinker").config()
    end,
    requires = "nvim-lua/plenary.nvim",
  },
  --
  -- Movement
  --
  {
    "phaazon/hop.nvim",
    config = function()
      require("plugins.hop").config()
    end,
    event = "BufRead",
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("plugins.harpoon").config()
    end,
    event = "BufWinEnter",
    requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
  },
  --
  -- Productivity
  --
  {
    "folke/zen-mode.nvim",
    config = function()
      require("plugins.zen-mode").config()
    end,
    event = "BufRead",
  },
  {
    "folke/twilight.nvim",
    config = function()
      require("plugins.twilight").config()
    end,
    event = "BufRead",
  },
  --
  -- Telescope
  --
  {
    "nvim-telescope/telescope-fzy-native.nvim",
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      if not lvim.builtin.dap.active then
        return
      end
      require("telescope").load_extension "dap"
    end,
    event = "BufWinEnter",
    after = "telescope.nvim",
  },
  --
  -- Themes
  --
  {
    "andersevenrud/nordic.nvim",
    config = function()
      require("themes.nordic").config()
    end,
  },
  --[[
  {
    "shaunsingh/nord.nvim",
    config = function()
      require("themes.nord").config()
    end,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("themes.tokyonight").config()
    end,
  },
  {
    "rafamadriz/neon",
    config = function()
      require("themes.neon").config()
    end,
  },
  {
    "sainnhe/sonokai",
    config = function()
      require("themes.sonokai").config()
    end,
  },
  {
    "rmehri01/onenord.nvim",
    config = function()
      require("themes.onenord").config()
    end,
  },
  --]]
  --
  -- Treesitter
  --
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
  },
  {
    "PasiBergman/cmp-nuget",
    event = "BufWinEnter",
    config = function()
      local is_ok, cmp_nuget = pcall(require, "cmp-nuget")
      if not is_ok then
        vim.notify "cmp-nuget could not be loaded"
      else
        cmp_nuget.setup()
        table.insert(lvim.builtin.cmp.sources, { name = "nuget" })
      end
    end,
  },
}
