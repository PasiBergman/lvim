vim.cmd [[setlocal ts=4 sw=4]]

local status_ok, dap = pcall(require, "dap")
if not status_ok then
  local Log = require "core.log"
  Log:get_default().error "Failed to load Debug Adapter Protocol (dap) plugin (.cs)"
  return
end

local utils = require "my.utils"
dap.configurations.cs = {
  {
    type = "netcoredbg",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return utils.get_debug_program()
    end,
  },
}
