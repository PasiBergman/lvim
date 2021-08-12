lvim.plugins = {
  {
    "maaslalani/nordbuddy",
    config = function()
      require("nordbuddy").colorscheme {
        -- Underline style used for spelling
        -- Options: 'none', 'underline', 'undercurl'
        underline_option = "undercurl",
        -- Italics for certain keywords such as constructors, functions,
        -- labels and namespaces
        italic = false,
        -- Italic styled comments
        italic_comments = false,
        -- Minimal mode: different choice of colors for Tabs and StatusLine
        minimal_mode = false,
      }
    end,
  },
  -- { "shaunsingh/nord.nvim" },
  -- { "folke/tokyonight.nvim" },
  ---{ "rafamadriz/neon" },
  -- { 'projekt0n/github-nvim-theme' },
  {
    "rizzatti/dash.vim",
    event = "BufWinEnter",
  },
  {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
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
  {
    "nvim-telescope/telescope-fzy-native.nvim",
  },
  {
    "abecodes/tabout.nvim",
    config = function()
      require("tabout").setup {
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      }
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-compe",
    event = "InsertEnter",
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = 1,
          height = 0.9, -- height of the Zen window
          width = 0.85,
          options = {
            signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
          },
        },
        plugins = {
          kitty = {
            enabled = true,
            font = "+4",
          },
        },
      }
    end,
    event = "BufRead",
  },
  --[[
  {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
    event = "BufRead",
  },
  --]]
}
