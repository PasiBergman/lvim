-- add PowerShell parser
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.powershell = {
  install_info = {
    url = "https://github.com/jrsconfitto/tree-sitter-powershell", -- local path or git repo
    files = { "src/parser.c" },
  },
  filetype = "ps1", -- if filetype does not agrees with parser name
  used_by = { "psm1", "psd1", "pssc", "psxml", "cdxml" }, -- additional filetypes that use this parser
}
