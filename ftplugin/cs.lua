vim.cmd [[setlocal ts=4 sw=4]]

if lvim.debug ~= true then return end

local status_ok, dap = pcall(require, "dap")
if not status_ok then
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
