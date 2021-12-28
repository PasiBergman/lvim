local utils = {}
--
-- Does package.json file contain speficied configuration or dependency?
-- (e.g. "prettier")
-- IMPORTANT! package.json file is found only if current working directory (cwd)
-- is in the root of the project, i.e. lvim was launched in the directory
-- where package.json is or vim-rooter (or something similar) is activated
--
utils.is_in_package_json = function(field)
  if vim.fn.filereadable(vim.fn.getcwd() .. "/package.json") ~= 0 then
    local package_json = vim.fn.json_decode(vim.fn.readfile "package.json")
    if package_json[field] ~= nil then
      return true
    end
    local dev_dependencies = package_json["devDependencies"]
    if dev_dependencies ~= nil and dev_dependencies[field] ~= nil then
      return true
    end
    local dependencies = package_json["dependencies"]
    if dependencies ~= nil and dependencies[field] ~= nil then
      return true
    end
  end
  return false
end

utils.is_web_project = function()
  return (vim.fn.glob "package.json" ~= "" or vim.fn.glob "yarn.lock" ~= "" or vim.fn.glob "node_modules" ~= "")
end

utils.decode_json_file = function(filename)
  if vim.fn.filereadable(filename) == 0 then
    return nil
  end

  return vim.fn.json_decode(vim.fn.readfile(filename))
end

utils.get_debug_program = function()
  local dap_config = require("utils").decode_json_file(vim.fn.getcwd() .. "/.dap.json")
  if dap_config ~= nil then
    local program = dap_config["program"]
    if program ~= nil then
      return program
    end
  end

  local vimspector_config = require("utils").decode_json_file(vim.fn.getcwd() .. "/.vimspector.json")
  if vimspector_config ~= nil then
    local config = vimspector_config["configurations"]
    if config ~= nil then
      local program = config["launch - netcoredbg"]["configuration"]["program"]
      return string.gsub(program, "${workspaceRoot}", vim.fn.getcwd())
    end
  end

  return vim.fn.input("Path to program: ", vim.fn.getcwd(), "file")
end

return utils
