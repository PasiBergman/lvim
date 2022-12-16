local Nordic = {}

Nordic.config = function()
  if lvim.colorscheme ~= "nordic" then
    return
  end

  require("nordic").colorscheme {
    -- Underline style used for spelling
    -- Options: 'none', 'underline', 'undercurl'
    underline_option = "undercurl",

    -- Italics for certain keywords such as constructors, functions,
    -- labels and namespaces
    italic = true,

    -- Italic styled comments
    italic_comments = true,

    -- Minimal mode: different choice of colors for Tabs and StatusLine
    minimal_mode = false,

    -- Darker backgrounds for certain sidebars, popups, etc.
    -- Options: true, false, or a table of explicit names
    -- Supported: terminal, qf, vista_kind, packer, nvim-tree, telescope, whichkey
    alternate_backgrounds = false,

    -- Callback function to define custom color groups
    -- c: color palette table
    --   see the palette file for available entries
    -- s: styles table
    --   none, bold, underline, italic, undercurl, strikethrough, reverse, inverse, standout, nocombine
    -- cs: user defined/configured styles table
    --   none, underline, italic, comments
    --   bg(name) -> default or alternate background color based on configuration
    custom_colors = function(c, s, cs)
      return {
        { "PmenuSel", "#2a3a33", "#8091b2", s.bold },
        -- SymbolsOutline fix
        { "Comment", "#667084", nil, nil },
        { "Visual", nil, "#3B4252", nil },
        -- Examples:
        -- Single highlight group (name, foreground, background, style)
        { "DummyHighlightName1", c.green, "#475063", s.undercurl },
        {
          { "DummyHighlightName2", "DummyHighlightName3" },
          c.red,
          c.white,
          s.bold,
        },
        -- Or a function that can return any of these combinations
        function(--[[c, s, cs]])
          return {
            {
              "DummyHighlightName4",
              c.red,
              cs.bg "plugin_name", -- Alternate or default background based on user configuration
              cs.underline,
            },
          }
        end,
      }
    end,
  }
end

return Nordic
