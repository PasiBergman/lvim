local Hop = {}

Hop.config = function()
  require("hop").setup()
  -- :HopChar2: type a bigram (two keys) and hop to any occurrence of that bigram in the document.
  vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
  -- :HopWord: hop around by highlighting words.
  vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
  --
  -- To be configured - if needed
  -- ===================================================================
  -- :HopPattern: hop around by matching against a pattern (as with /).
  -- :HopChar1: type a single key and hop to any occurrence of that key in the document.
  -- :HopLine: jump to any visible line in your buffer.
  -- :HopLineStart: jump to any visible first non-whitespace character of each line in your buffer.
end

return Hop
