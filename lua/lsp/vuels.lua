-- Returns the index of a item in the list
local indexOf = function(array, value)
  for i, v in ipairs(array) do
    if v == value then
      return i
    end
  end
  return nil
end

vim.list_extend(lvim.lsp.override, { "volar" })
local vuels = indexOf(lvim.lsp.override, "vuels")

-- If vuels is found in the override list, then remove it from the list
if vuels ~= nil then
  local new_override = vim.list_slice(lvim.lsp.override, 1, vuels - 1)
  vim.list_extend(new_override, vim.list_slice(lvim.lsp.override, vuels + 1))
  lvim.lsp.override = new_override
end
