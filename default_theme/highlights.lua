return {
  function(highlights)
    local C = require "default_theme.colors"

    highlights.Normal = { fg = C.fg, bg = C.bg }
    return highlights
  end,
}
