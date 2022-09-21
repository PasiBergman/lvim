local OneNord = {}

OneNord.config = function()
  require("onenord").setup {
    borders = true, -- Split window borders
    italics = {
      comments = true, -- Italic comments
      strings = false, -- Italic strings
      keywords = false, -- Italic keywords
      functions = false, -- Italic functions
      variables = false, -- Italic variables
    },
    disable = {
      background = false, -- Disable setting the background color
      cursorline = false, -- Disable the cursorline
      eob_lines = true, -- Hide the end-of-buffer lines
    },
  }
end

return OneNord
