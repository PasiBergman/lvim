local M = {}
-- Configure DAP

M.config = function()
  local status_ok, dap = pcall(require, "dap")
  if not status_ok then
    local Log = require "core.log"
    Log:get_default().error "Failed to load Debug Adapter Protocol (dap) plugin"
    return
  end

  --
  -- .NET core (netcoredbg)
  --
  local netcoredbg = vim.fn.expand "$HOME/.local/share/nvim/dapinstall/dnetcs_dbg/netcoredbg/netcoredbg"

  if vim.fn.executable(netcoredbg) ~= 1 then
    local Log = require "core.log"
    Log:get_default().error(".NET debug adapter not executable: " .. netcoredbg)
    return
  end

  local engine_log = string.format("%s/netcoredbg.engine.log", CACHE_PATH)
  local debug_log = string.format("%s/netcoredbg.log", CACHE_PATH)

  dap.adapters.netcoredbg = {
    type = "executable",
    command = netcoredbg,
    args = {
      "--interpreter=vscode",
      "--engineLogging=" .. engine_log,
      "--log=" .. debug_log,
    },
  }
end

return M
