require("rose-pine").setup {
  -- -@usage 'main'|'moon'
  -- dark_variant = "main",
  dark_variant = "moon",
  bold_vert_split = false,
  dim_nc_background = false,
  disable_background = false,
  disable_float_background = true,
  disable_italics = false,
  ---@usage string hex value or named color from rosepinetheme.com/palette
  groups = {
    background = "base",
    panel = "surface",
    border = "highlight_med",
    comment = "muted",
    link = "iris",
    punctuation = "subtle",

    error = "love",
    hint = "iris",
    info = "foam",
    warn = "gold",

    git_add = "foam",
    git_change = "rose",
    git_delete = "love",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "pine",
    git_stage = "iris",
    git_text = "rose",

    headings = {
      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "pine",
      h6 = "foam",
    },
    -- or set all headings at once
    -- headings = 'subtle'
  },
  -- Change specific vim highlight groups
  highlight_groups = {
    -- ColorColumn = { bg = "rose" },
  },
}

-- set colorscheme after options
-- vim.cmd "hi CursorLine guibg=#21202e"
vim.cmd "colorscheme rose-pine"
