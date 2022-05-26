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

-- Theme table
local my_theme = {
    fg = "#e0def4",
    bg = "#2a283e",
    black = "#232136",
    skyblue = "#eb6f92",
    -- cyan = "#9ccfd8",
    -- green = "#56949f",
    green = "#56f49f",
    oceanblue = "#44415a",
    -- magenta = "#c4a7e7",
    -- orange = "#ea9a97",
    red = "#eb6f92",
    violet = "#ea9d34",
    -- white = "#faf4ed",
    yellow = "#ea9d34",
}

-- require('feline').setup()
require("feline").use_theme(my_theme)
