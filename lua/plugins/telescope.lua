local Telescope = {}

Telescope.config = function()
  if not lvim.builtin.telescope.active then
    return
  end

  lvim.builtin.telescope.extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  }
  lvim.builtin.telescope.on_config_done = function()
    require("telescope").load_extension "fzy_native"
  end

  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 80
  lvim.builtin.telescope.defaults.layout_config.width = 0.95
  local actions = require "telescope.actions"
  local mappings = {
    i = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-c>"] = actions.close,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
      ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      ["<CR>"] = actions.select_default + actions.center,
    },
    n = {
      ["<C-j>"] = actions.move_selection_next,
      ["<C-k>"] = actions.move_selection_previous,
      ["<C-n>"] = actions.cycle_history_next,
      ["<C-p>"] = actions.cycle_history_prev,
      ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    },
  }
  lvim.builtin.telescope.defaults.mappings = mappings
end

local previewers = require "telescope.previewers"
local builtin = require "telescope.builtin"

local delta = {}
if vim.fn.executable "delta" == 1 then
  delta = previewers.new_termopen_previewer {
    get_command = function(entry)
      -- this is for status
      -- You can get the AM things in entry.status. So we are displaying file if entry.status == '??' or 'A '
      -- just do an if and return a different command
      if entry.status == "??" or "A " then
        return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value }
      end

      -- note we can't use pipes
      -- this command is for git_commits and git_bcommits
      return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
    end,
  }
end

Telescope.delta_git_commits = function(opts)
  if vim.fn.executable "delta" ~= 1 then
    return
  end

  opts = opts or {}
  opts.previewer = delta

  builtin.git_commits(opts)
end

Telescope.delta_git_bcommits = function(opts)
  if vim.fn.executable "delta" ~= 1 then
    return
  end

  opts = opts or {}
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

Telescope.delta_git_status = function(opts)
  if vim.fn.executable "delta" ~= 1 then
    return
  end

  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

--[[
function Telescope.code_actions()
  local opts = {
    winblend = 15,
    layout_config = {
      prompt_position = "top",
      -- width = 80,
      -- height = 12,
    },
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      -- preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    border = {},
    previewer = false,
    shorten_path = false,
  }
  local themes = require "telescope.themes"
  builtin.lsp_code_actions(themes.get_cursor(opts))
end
--]]

return Telescope
