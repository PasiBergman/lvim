local Dash = {}

Dash.config = function()
  if not lvim.builtin.telescope.active then
    return
  end
  --
  --  If Dash.nvim plugin is installed and Dash.app is found
  -- configure Dash as a Telescope extension
  --
  local status_ok, _ = pcall(require, "dash")
  if status_ok then
    local dash_app = vim.fn.glob "/Applications/Dash.app"
    if dash_app == "" then
      dash_app = vim.fn.glob "/Applications/Setapp/Dash.app"
    end
    if dash_app == "" then
      Log:warn "Dash.nvim plugin installed but Dash.app was not found. Check configuration."
      return
    end
    lvim.builtin.telescope.extensions["dash"] = {
      dash_app_path = dash_app,
      -- search engine to fall back to when Dash has no results, must be one of: 'ddg', 'duckduckgo', 'startpage', 'google'
      search_engine = "duckduckgo",
      -- debounce while typing, in milliseconds
      debounce = 0,
      -- map filetype strings to the keywords you've configured for docsets in Dash
      -- setting to false will disable filtering by filetype for that filetype
      -- filetypes not included in this table will not filter the query by filetype
      -- check src/lua_bindings/dash_config_binding.rs to see all defaults
      -- the values you pass for file_type_keywords are merged with the defaults
      -- to disable filtering for all filetypes,
      -- set file_type_keywords = false
      file_type_keywords = {
        dashboard = false,
        NvimTree = false,
        TelescopePrompt = false,
        terminal = false,
        packer = false,
        fzf = false,
        -- a table of strings will search on multiple keywords
        javascript = { "javascript", "nodejs" },
        typescript = { "typescript", "javascript", "nodejs", "moment" },
        typescriptreact = { "typescript", "javascript", "react" },
        javascriptreact = { "javascript", "react" },
        vue = { "vue", "typescript", "html", "bootstrap-vue", "css" },
        html = { "html", "bootstrap", "css" },
        css = { "css", "media" },
        scss = { "css", "media" },
        markdown = { "markdown" },
        lua = { "lua" },
        python = { "python3" },
        -- you can also do a string, for example,
        -- sh = 'bash'
      },
    }
  end
end

return Dash
