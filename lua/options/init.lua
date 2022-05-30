-- Format buffer when buffer/file is saved
lvim.format_on_save = true

-- Theme/Colorscheme
lvim.colorscheme = "nordic"

-- Leader key
lvim.leader = "space"

-- Keymap timeout
vim.go.timeoutlen = 500

-- Relative row numbers
vim.go.relativenumber = true

-- Debug LunarVim
lvim.debug = false

-- kitty
-- https://sw.kovidgoyal.net/kitty/faq/#some-special-symbols-are-rendered-small-truncated-in-kitty
vim.cmd [[let &t_ut='']]

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile

-- Disable floating terminal - using tmux instead
lvim.builtin.terminal.active = false
-- Disable debugging - using Vimspector for now
lvim.builtin.dap.active = false

-- lvim.builtin.treesitter.playground.enable = true

-- Close Nvim-Tree automatically after file opened
-- lvim.builtin.nvimtree.setup.actions.open_file.quit_on_open = true

-- Disable BufferLine
-- lvim.builtin.bufferline.active = false
