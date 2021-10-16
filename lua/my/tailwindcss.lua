--
-- Activate LunarVim tailwindcss lsp configuration only
-- if project seems to have a tailwindcss dependency
--
local utils = require "my.utils"
local project_has_tailwindcss_dependency = function()
  return (vim.fn.glob "tailwind*" ~= "" or utils.is_in_package_json "tailwindcss")
end

lvim.lang.tailwindcss.active = project_has_tailwindcss_dependency()

if project_has_tailwindcss_dependency() == true then
  require("lvim.lsp.manager").setup "tailwindcss"
else
  lvim.lsp.override = { "tailwindcss" }
end
