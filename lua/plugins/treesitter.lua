local Treesitter = {}

Treesitter.config = function()
  if not lvim.builtin.treesitter.active then
    return
  end

  -- if you don't want all the parsers change this to a table of the ones you want
  lvim.builtin.treesitter.ensure_installed = {
    "c",
    "c_sharp",
    "comment",
    "cpp",
    "dockerfile",
    "go",
    "html",
    "http",
    "jsdoc",
    "scss",
    "svelte",
    "tsx",
    "vim",
    "vue",
    "bash",
    "css",
    "java",
    "javascript",
    "json",
    "lua",
    "python",
    "rust",
    "tsx",
    "typescript",
    "yaml",
  }
  lvim.builtin.treesitter.highlight.enabled = true
end

return Treesitter
