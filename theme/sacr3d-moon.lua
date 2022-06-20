--=> Default Color table
-- [ Name ]     [ Value ]
-------------------------
-- fg           '#D0D0D0'
-- bg           '#1F1F23'
-- black        '#1B1B1B'
-- skyblue      '#50B0F0'
-- cyan         '#009090'
-- green        '#60A040'
-- oceanblue    '#0066cc'
-- magenta      '#C26BDB'
-- orange       '#FF9000'
-- red          '#D10000'
-- violet       '#9E93E8'
-- white        '#FFFFFF'
-- yellow       '#E1E120'

--=> DEFAULT SEPARATORS
--         [Name]          [Value]
-----------------------------------
-- vertical_bar          │  '┃'   │
-- vertical_bar_thin     │  '│'   │
-- left                  │  ''   │
-- right                 │  ''   │
-- block                 │  '█'   │
-- left_filled           │  ''   │
-- right_filled          │  ''   │
-- slant_left            │  ''   │
-- slant_left_thin       │  ''   │
-- slant_right           │  ''   │
-- slant_right_thin      │  ''   │
-- slant_left_2          │  ''   │
-- slant_left_2_thin     │  ''   │
-- slant_right_2         │  ''   │
-- slant_right_2_thin    │  ''   │
-- left_rounded          │  ''   │
-- left_rounded_thin     │  ''   │
-- right_rounded         │  ''   │
-- right_rounded_thin    │  ''   │
-- circle                │  '●'   │
-----------------------------------

-->> Theme table
local my_theme = {
  fg = "#e0def4",
  bg = "#2a283e",
  black = "#232136",
  skyblue = "#b497f7",
  -- cyan = "#9ccfd8",
  -- green = "#56949f",
  green = "#64617a",
  oceanblue = "#44415a",
  magenta = "#c4a7e7",
  orange = "#ea9a97",
  red = "#56f49f",
  violet = "#ea9a97",
  -- white = "#faf4ed",
  yellow = "#ea9d34",

  -- Making icon always visible
  -- icon = {
  --   str = "", --
  --   hl = {
  --     fg = require("feline.providers.vi_mode").get_mode_color(),
  --     bg = "black",
  --     style = "bold",
  --   },
  --   always_visible = true,
  -- },

  -- -- Setting sep to a table with highlight
  -- left_sep = {
  --   str = "slant_left",
  --   hl = {
  --     fg = "#e0def4",
  --     bg = "#2a283e",
  --   },
  -- },

  -- Making sep always visible
  -- right_sep = {
  --   str = " ",
  --   always_visible = true,
  -- },
}

-- require('feline').setup()
require("feline").use_theme(my_theme)
