local utils = require "user.utils"

-- If project seems to be a web development project
if utils.is_web_project() then
  -- Emmet LS manual setup
  require("lvim.lsp.manager").setup "emmet_ls"
end
