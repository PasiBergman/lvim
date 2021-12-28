-- Configure DAP
local Log = require "lvim.core.log"

local DAP = {}

DAP.config = function()
  if not lvim.builtin.dap.active then
    return
  end

  local status_ok, dap = pcall(require, "dap")
  if not status_ok then
    Log:get_default().error "Failed to load Debug Adapter Protocol (dap) plugin"
    return
  end
  --
  -- .NET core (netcoredbg)
  --
  local netcoredbg = vim.fn.expand "$HOME/.local/share/nvim/dapinstall/dnetcs_dbg/netcoredbg/netcoredbg"

  if vim.fn.executable(netcoredbg) ~= 1 then
    Log:get_default().error(".NET debug adapter not executable: " .. netcoredbg)
    return
  end

  local engine_log = string.format("%s/netcoredbg.engine.log", vim.fn.stdpath "cache")
  local debug_log = string.format("%s/netcoredbg.log", vim.fn.stdpath "cache")

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

return DAP
