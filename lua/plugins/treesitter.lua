local Treesitter = {}

Treesitter.config = function()
  if not lvim.builtin.treesitter.active then
    return
  end

  -- if you don't want all the parsers change this to a table of the ones you want
  lvim.builtin.treesitter.ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "python",
    "rust",
    "scss",
    "svelte",
    "toml",
    "tsx",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  }
  lvim.builtin.treesitter.highlight.enabled = true
end

return Treesitter
