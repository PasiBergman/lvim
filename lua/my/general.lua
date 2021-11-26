-- general
lvim.format_on_save = true

-- lvim.colorscheme = "onedarker"
lvim.colorscheme = "nordbuddy"
-- lvim.colorscheme = "nord"
-- lvim.colorscheme = "onenord"

-- keymappings
lvim.leader = "space"

-- keymap timeout
vim.cmd [[set timeoutlen=250]]

-- debug
lvim.debug = false

-- Set session directory
vim.g.dashboard_session_directory = vim.fn.expand "$HOME/.cache/lvim/sessions"

-- kitty
-- https://sw.kovidgoyal.net/kitty/faq/#some-special-symbols-are-rendered-small-truncated-in-kitty
vim.cmd [[let &t_ut='']]

-- Set relative row numbers
vim.cmd [[set relativenumber]]
