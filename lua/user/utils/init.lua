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
    if package_json == nil then
      return false
    end
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

utils.is_arduino_project = function()
  return (vim.fn.glob "*.ino" ~= "")
end

utils.decode_json_file = function(filename)
  if vim.fn.filereadable(filename) == 0 then
    return nil
  end

  return vim.fn.json_decode(vim.fn.readfile(filename))
end

utils.replace_string_values = function(original, to_replace, replace_with)
  if type(original) == "string" or type(original) == "number" then
    return string.gsub(original, to_replace, replace_with)
  end

  if type(original) == "table" then
    for key, value in pairs(original) do
      original[key] = utils.replace_string_values(value, to_replace, replace_with)
    end
  end

  return original
end

utils.get_debug_config = function()
  local dap_config = utils.decode_json_file(vim.fn.getcwd() .. "/.dap.json")
  if dap_config ~= nil then
    return { dap_config }
  end

  local status_ok, vscode_launch_file = pcall(utils.decode_json_file, vim.fn.getcwd() .. "/.vscode/launch.json")
  if status_ok and vscode_launch_file ~= nil then
    local configs = vscode_launch_file["configurations"]
    if configs ~= nil then
      for j = 1, #configs do
        if configs[j]["request"] == "launch" then
          local config = utils.replace_string_values(configs[j], "${workspaceRoot}", vim.fn.getcwd())
          return { config }
        end
      end
      return utils.replace_string_values(configs, "${workspaceRoot}", vim.fn.getcwd())
    end
  end

  return nil
end

utils.get_debug_program = function()
  local dap_config = utils.decode_json_file(vim.fn.getcwd() .. "/.dap.json")
  if dap_config ~= nil then
    local program = dap_config["program"]
    if program ~= nil then
      return program
    end
  end

  local status_ok, vscode_launch_file = pcall(utils.decode_json_file, vim.fn.getcwd() .. "/.vscode/launch.json")
  if not status_ok or vscode_launch_file == nil then
    print "./.vscode/launch.json file not found or is invalid for json decoding."
    return ""
  end

  local configs = vscode_launch_file["configurations"]
  if configs ~= nil then
    for j = 1, #configs do
      if configs[j]["request"] == "launch" then
        return utils.replace_string_values(configs[j]["program"], "${workspaceRoot}", vim.fn.getcwd())
      end
    end
  end
  return ""
end

-- Returns the index of a item in the list
utils.indexOf = function(array, value)
  for i, v in ipairs(array) do
    if v == value then
      return i
    end
  end
  return nil
end

-- Does the current project have a Prettier configuration?
-- Assumes, that LunarVim has been opened in the root of the project
utils.project_has_prettier_config = function()
  local hasprettier = (
    vim.fn.glob ".prettierrc*" ~= ""
    or vim.fn.glob "prettier.*" ~= ""
    or utils.is_in_package_json "prettier"
  )
  -- print("Project does has prettier configured? " .. tostring(hasprettier))
  return hasprettier
end

return utils
