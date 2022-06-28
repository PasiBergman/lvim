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
    cmd = { "VimspectorInstall", "VimspectorUpdate" },
    fn = { "vimspector#Launch()", "vimspector#ToggleBreakpoint", "vimspector#Continue" },
    config = function()
      require("plugins.vimspector").config()
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
      require("plugins.trouble").config()
      local trouble = require "trouble.providers.telescope"

      lvim.builtin.telescope.defaults.mappings.i["<C-t>"] = trouble.open_with_trouble
      lvim.builtin.telescope.defaults.mappings.n["<C-t>"] = trouble.open_with_trouble
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
    "Hoffs/omnisharp-extended-lsp.nvim",
  },
  --[[
  {
    "nvim-treesitter/playground",
  },
  --]]
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
      lvim.builtin.cmp.formatting.source_names["nuget"] = "(NuGet)"
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
      lvim.builtin.cmp.formatting.source_names["npm"] = "(NPM)"
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "python", "html", "css", "scss", "typescript", "vue" }, {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        names = true,
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
      })
    end,
  },
  --
  -- Github Copilot
  --
  {
    "github/copilot.vim",
    config = function()
      require("plugins.copilot").config_vim()
    end,
  },
}
