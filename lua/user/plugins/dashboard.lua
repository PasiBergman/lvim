local Dashboard = {}

Dashboard.config = function()
  if not lvim.builtin.alpha.active then
    return
  end

  -- Set session directory
  vim.g.dashboard_session_directory = vim.fn.expand "$HOME/.cache/lvim/sessions"

  --[[
  -- Dashboard
  local ds = lvim.builtin.dashboard.custom_section
  -- local project_desc = ds.c.description
  -- local project_cmd = ds.c.command
  ds.b = {
    description = ds.d.description,
    command = ds.d.command,
  }
  ds.c = {
    description = { "  Git files          " },
    command = "Telescope git_files",
  }
  ds.d = nil
  --]]
end

return Dashboard
