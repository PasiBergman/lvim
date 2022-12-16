local status_ok, dap = pcall(require, "dap")
if not status_ok then return end

-- Note December 16 2022
-- Manually installed netcoredbg for Mac M1 ARM64
-- https://github.com/codeprefect/netcoredbg/releases/tag/2.2.0-950
--
-- Remember to allow execution of unsigned netcoredbg executabe on macOS
--
-- If you are using amd64/x86 computer, you may install netcoredbg with Mason.
--
dap.adapters.coreclr = {
  type = "executable",
  command = vim.fn.expandcmd "~/.netcoredbg/netcoredbg",
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
        vim.fn.getcwd() .. "/src/<>.BE.API/bin/Debug/net7.0/<>.BE.API.dll",
        "file"
      )
    end,
  },
}
