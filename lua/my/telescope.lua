-- Implement delta as previewer for diffs

-- Requires git-delta, e.g. on macOS
-- brew install git-delta
local Log = require "lvim.core.log"

local previewers = require "telescope.previewers"
local builtin = require "telescope.builtin"
-- local conf = require('telescope.config')

--
--  If Dash.nvim plugin is installed and Dash.app is found
-- configure Dash as a Telescope extension
--
local status_ok, _ = pcall(require, "dash")
if status_ok then
  local dash_app = vim.fn.glob "/Applications/Dash.app"
  if dash_app == "" then
    dash_app = vim.fn.glob "/Applications/Setapp/Dash.app"
  end
  if dash_app == "" then
    Log:warn "Dash.nvim plugin installed but Dash.app was not found. Check configuration."
    return
  end
  lvim.builtin.telescope.extensions["dash"] = {
    dash_app_path = dash_app,
    -- search engine to fall back to when Dash has no results, must be one of: 'ddg', 'duckduckgo', 'startpage', 'google'
    search_engine = "duckduckgo",
    -- debounce while typing, in milliseconds
    debounce = 0,
    -- map filetype strings to the keywords you've configured for docsets in Dash
    -- setting to false will disable filtering by filetype for that filetype
    -- filetypes not included in this table will not filter the query by filetype
    -- check src/lua_bindings/dash_config_binding.rs to see all defaults
    -- the values you pass for file_type_keywords are merged with the defaults
    -- to disable filtering for all filetypes,
    -- set file_type_keywords = false
    file_type_keywords = {
      dashboard = false,
      NvimTree = false,
      TelescopePrompt = false,
      terminal = false,
      packer = false,
      fzf = false,
      -- a table of strings will search on multiple keywords
      javascript = { "javascript", "nodejs" },
      typescript = { "typescript", "javascript", "nodejs", "moment" },
      typescriptreact = { "typescript", "javascript", "react" },
      javascriptreact = { "javascript", "react" },
      vue = { "vue", "typescript", "html", "bootstrap-vue", "css" },
      html = { "html", "bootstrap", "css" },
      css = { "css", "media" },
      scss = { "css", "media" },
      markdown = { "markdown" },
      lua = { "lua" },
      python = { "python3" },
      -- you can also do a string, for example,
      -- sh = 'bash'
    },
  }
end

local E = {}

local delta = previewers.new_termopen_previewer {
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

E.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_commits(opts)
end

E.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

E.my_git_status = function(opts)
  opts = opts or {}
  opts.previewer = delta

  builtin.git_status(opts)
end

return E
