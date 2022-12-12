local dap = require "dap"

dap.adapters.coreclr = {
  type = "executable",
  command = vim.fn.expandcmd "~/.local/share/nvim/mason/bin/netcoredbg",
  args = { "--interpreter=vscode" },
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input(
        "Path to dll: ",
        vim.fn.getcwd() .. "/src/Skylla.BE.API/bin/Debug/net6.0/Skylla.BE.API.dll",
        "file"
      )
    end,
  },
}
