-- general
lvim.format_on_save = true
lvim.lint_on_save = true
lvim.colorscheme = "nordbuddy"
-- lvim.colorscheme = "spacegray"

-- keymappings
lvim.leader = "space"

-- keymap timeout
vim.cmd [[set timeoutlen=250]]

-- debug
lvim.debug = true

-- Set session directory
-- vim.g.dashboard_session_directory = vim.fn.expand "$HOME/.cache/lvim/sessions"

-- kitty
-- https://sw.kovidgoyal.net/kitty/faq/#some-special-symbols-are-rendered-small-truncated-in-kitty
vim.cmd [[let &t_ut='']]

-- Set relative row numbers
vim.cmd [[set relativenumber]]

-- neon coloscheme
-- vim.g.neon_style = "default" -- default, doom, dark, light
-- vim.g.neon_italic_comment = true
-- vim.g.neon_italic_keywork = true
-- vim.g.neon_italic_boolean = true
-- vim.g.neon_italic_function = true
-- vim.g.neon_italic_variable = false
-- vim.g.neon_bold = true
-- vim.g.neon_transparent = false
-- lvim.colorscheme = "neon"

-- tokyonight.nvim colorscheme
-- vim.g.tokyonight_colors = { error = "#ff5500" }
-- vim.g.tokyonight_italic_functions = false
-- vim.g.tokyonight_sidebars = { "NvimTree", "terminal" }
-- lvim.colorscheme = "tokyonight"

-- nord.nvim colorscheme
-- vim.g.nord_contrast = false
-- vim.g.nord_borders = true
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = true
-- load the colorscheme
-- lvim.colorscheme = "nord"
-- require("nord").set()
