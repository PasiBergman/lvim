local Nordic = {}

Nordic.config = function()
  require("nordic").colorscheme {
    -- Underline style used for spelling
    -- Options: 'none', 'underline', 'undercurl'
    underline_option = "none",

    -- Italics for certain keywords such as constructors, functions,
    -- labels and namespaces
    italic = true,

    -- Italic styled comments
    italic_comments = false,

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
        -- Single highlight group (name, foreground, background, style)
        { "PmenuSel", "#2b2d3a", "#9ed06c", s.bold },
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
              "DummyHightlightName4",
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
