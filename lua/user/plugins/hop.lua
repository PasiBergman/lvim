local M = {}

M.config = function()
  local status_ok, hop = pcall(require, "hop")
  if not status_ok then
    return
  end

  hop.setup()
  local directions = require("hop.hint").HintDirection

  -- Override the default f and F
  vim.keymap.set("", "f", function()
    hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
  end, { remap = true })
  vim.keymap.set("", "F", function()
    hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
  end, { remap = true })
  vim.keymap.set("", "t", function()
    hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
  end, { remap = true })
  vim.keymap.set("", "T", function()
    hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
  end, { remap = true })

  -- Skandinavian keyboard has Ö on the right side of letter L
  vim.keymap.set("", "ö", function()
    hop.hint_char2 { direction = directions.AFTER_CURSOR, current_line_only = false }
  end, { remap = true })
  vim.keymap.set("", "Ö", function()
    hop.hint_char2 { direction = directions.BEFORE_CURSOR, current_line_only = false }
  end, { remap = true })
end

return M
