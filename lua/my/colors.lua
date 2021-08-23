--[[
if lvim.colorscheme == "sonokai" then
  -- sonokai andromda
  lvim.builtin.galaxyline.colors = {
    bg = "#2b2d3a",
    alt_bg = "#3a3e4e",
    blue = "#6dcae8",
    cyan = "#f89860",
    error_red = "#ff4400",
    green = "#9ed06c",
    grey = "#858585",
    hint_blue = "#9CDCFE",
    info_yellow = "#FFCC66",
    magenta = "#bb97ee",
    orange = "#ff9900",
    purple = "#c586c0",
    red = "#fb617e",
    warning_orange = "#ff9900",
    yellow = "#f0c362",
  }
end

if lvim.colorscheme == "nordbuddy" then
  -- nordbuddy additions
  lvim.builtin.galaxyline.colors = {
    alt_bg = "#3B414D",
    bg = "2e3440",
    error_red = "#ff4400",
    hint_blue = "#9CDCFE",
    info_yellow = "#FFCC66",
    magenta = "#b48ead",
    warning_orange = "#FF9900",
  }
end

if lvim.colorscheme == "neon" then
  lvim.builtin.galaxyline.colors = require("neon.colors").generate()
end

if lvim.colorscheme == "tokyonight" then
  -- tokyonight
  lvim.builtin.galaxyline.colors = {
    none = "NONE",
    bg_dark = "#1f2335",
    bg = "#24283b",
    alt_bg = "#292e42",
    terminal_black = "#414868",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",
    blue0 = "#3d59a1",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",
    blue7 = "#394b70",
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    purple = "#9d7cd8",
    orange = "#ff9e64",
    yellow = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f7768e",
    red1 = "#db4b4b",
  }
end

if lvim.colorscheme == "nord" then
  -- nord
  lvim.builtin.galaxyline.colors = {
    bg = "#2E3440",
    fg = "#D8DEE9",
    alt_bg = "#3B4252",
    black = "#3B4252",
    yellow = "#EBCB8B",
    red = "#BF616A",
    green = "#A3BE8C",
    blue = "#81A1C1",
    magenta = "#B48EAD",
    cyan = "#88C0D0",
    white = "#E5E9F0",
  }
end
--]]
