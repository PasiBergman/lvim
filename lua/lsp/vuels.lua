local utils = require "utils"

vim.list_extend(lvim.lsp.override, { "volar" })
local vuels = utils.indexOf(lvim.lsp.override, "vuels")

-- If vuels is found in the override list, then remove it from the list
if vuels ~= nil then
  local new_override = vim.list_slice(lvim.lsp.override, 1, vuels - 1)
  vim.list_extend(new_override, vim.list_slice(lvim.lsp.override, vuels + 1))
  lvim.lsp.override = new_override
end
