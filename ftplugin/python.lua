-- ~/.config/lvim/ftplugin/python.lua
local status_ok, dap = pcall(require, "dap")
if not status_ok then
  local Log = require "core.log"
  Log:get_default().error "Failed to load Debug Adapter Protocol (dap) plugin"
  return
end

local dap_install = require "dap-install"
dap_install.config("python_dbg", {})
