local Telescope = {}

local previewers_ok, previewers = pcall(require, "telescope.previewers")
if not previewers_ok then
  return
end
local builtin_ok, builtin = pcall(require, "telescope.builtin")
if not builtin_ok then
  return
end

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
  opts.layout_config = {
    width = 0.97,
  }
  builtin.git_commits(opts)
end

Telescope.delta_git_bcommits = function(opts)
  if vim.fn.executable "delta" ~= 1 then
    return
  end

  opts = opts or {}
  opts.layout_config = {
    width = 0.97,
  }
  opts.previewer = delta

  builtin.git_bcommits(opts)
end

Telescope.delta_git_status = function(opts)
  if vim.fn.executable "delta" ~= 1 then
    return
  end

  opts = opts or {}
  opts.layout_config = {
    width = 0.97,
  }
  opts.previewer = delta

  builtin.git_status(opts)
end

return Telescope
