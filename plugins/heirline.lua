local conditions = require "heirline.conditions"
local utils = require "heirline.utils"

local colors = {
  bright_bg = utils.get_highlight("Folded").bg,
  red = utils.get_highlight("DiagnosticError").fg,
  dark_red = utils.get_highlight("DiffDelete").bg,
  green = utils.get_highlight("String").fg,
  blue = utils.get_highlight("Function").fg,
  gray = utils.get_highlight("NonText").fg,
  orange = utils.get_highlight("Constant").fg,
  purple = utils.get_highlight("Statement").fg,
  cyan = utils.get_highlight("Special").fg,
  diag_warn = utils.get_highlight("DiagnosticWarn").fg,
  diag_error = utils.get_highlight("DiagnosticError").fg,
  diag_hint = utils.get_highlight("DiagnosticHint").fg,
  diag_info = utils.get_highlight("DiagnosticInfo").fg,
  -- git_del = utils.get_highlight("diffDeleted").fg,
  -- git_add = utils.get_highlight("diffAdded").fg,
  -- git_change = utils.get_highlight("diffChanged").fg,
}

require("heirline").load_colors(colors)

local ViMode = {
  -- get vim current mode, this information will be required by the provider
  -- and the highlight functions, so we compute it only once per component
  -- evaluation and store it as a component attribute
  init = function(self)
    self.mode = vim.fn.mode(1) -- :h mode()

    -- execute this only once, this is required if you want the ViMode
    -- component to be updated on operator pending mode
    if not self.once then
      vim.api.nvim_create_autocmd("ModeChanged", { command = "redrawstatus" })
      self.once = true
    end
  end,
  -- Now we define some dictionaries to map the output of mode() to the
  -- corresponding string and color. We can put these into `static` to compute
  -- them at initialisation time.
  static = {
    mode_names = { -- change the strings if you like it vvvvverbose!
      n = "",
      -- n = "N",
      -- n = "💀",
      no = "N?",
      nov = "N?",
      noV = "N?",
      ["no\22"] = "N?",
      niI = "Ni",
      niR = "Nr",
      niV = "Nv",
      nt = "Nt",
      v = "",
      -- v = "V",
      vs = "Vs",
      V = "",
      -- V = "V_",
      Vs = "Vs",
      ["\22"] = "^V",
      ["\22s"] = "^V",
      s = "",
      S = "",
      -- s = "S",
      -- S = "S_",
      ["\19"] = "^S",
      i = "",
      -- i = "I",
      ic = "Ic",
      ix = "Ix",
      R = "",
      -- R = "R",
      Rc = "Rc",
      Rx = "Rx",
      Rv = "Rv",
      Rvc = "Rv",
      Rvx = "Rv",
      c = "",
      -- c = "C",
      cv = "Ex",
      r = "...",
      rm = "M",
      ["r?"] = "?",
      ["!"] = "!",
      t = "T",
    },
    mode_colors = {
      n = "#ff5f90",
      i = "#0fff90",
      v = "#9f7ff0",
      V = "#cf8ff0",
      ["\22"] = "#3fffbf",
      c = "#6fffdf",
      -- c = "orange",
      s = "purple",
      S = "purple",
      ["\19"] = "purple",
      R = "orange",
      r = "orange",
      ["!"] = "red",
      t = "red",
    },
  },
  -- We can now access the value of mode() that, by now, would have been
  -- computed by `init()` and use it to index our strings dictionary.
  -- note how `static` fields become just regular attributes once the
  -- component is instantiated.
  -- To be extra meticulous, we can also add some vim statusline syntax to
  -- control the padding and make sure our string is always at least 2
  -- characters long. Plus a nice Icon.
  provider = function(self)
    return " "
    -- return " %2(" .. self.mode_names[self.mode] .. "%)"
  end,
  -- Same goes for the highlight. Now the foreground will change according to the current mode.
  hl = function(self)
    local mode = self.mode:sub(1, 1) -- get only the first mode character
    return { fg = self.mode_colors[mode], bold = true }
  end,
  -- Re-evaluate the component only on ModeChanged event!
  -- This is not required in any way, but it's there, and it's a small
  -- performance improvement.
  update = "ModeChanged",
}

local FileNameBlock = {
  -- let's first set up some attributes needed by this component and it's children
  init = function(self)
    self.filename = vim.api.nvim_buf_get_name(0)
  end,
}
-- We can now define some children separately and add them later

local FileIcon = {
  init = function(self)
    local filename = self.filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
  end,
  provider = function(self)
    return self.icon and (self.icon .. " ")
  end,
  hl = function(self)
    return { fg = self.icon_color }
  end,
}

-- local FileName = {
--   init = function(self)
--     self.lfilename = vim.fn.fnamemodify(self.filename, ":.")
--     if self.lfilename == "" then
--       self.lfilename = "[No Name]"
--     end
--   end,
--   hl = { fg = utils.get_highlight("Directory").fg },
--
--   utils.make_flexible_component(2, {
--     provider = function(self)
--       return self.lfilename
--     end,
--   }, {
--     provider = function(self)
--       return vim.fn.pathshorten(self.lfilename)
--     end,
--   }),
-- }

local FileName = {
  provider = function(self)
    -- first, trim the pattern relative to the current directory. For other
    -- options, see :h filename-modifers
    local filename = vim.fn.fnamemodify(self.filename, ":.")
    if filename == "" then
      return "[No Name]"
    end
    -- now, if the filename would occupy more than 1/4th of the available
    -- space, we trim the file path to its initials
    -- See Flexible Components section below for dynamic truncation
    if not conditions.width_percent_below(#filename, 0.25) then
      filename = vim.fn.pathshorten(filename)
    end
    return filename
  end,
  hl = { fg = "#e0def4" },
  -- hl = { fg = utils.get_highlight("Directory").fg },
}

local FileFlags = {
  {
    provider = function()
      if vim.bo.modified then
        return "[+]"
      end
    end,
    hl = { fg = "#e0def4" },
    -- hl = { fg = "green" },
  },
  {
    provider = function()
      if not vim.bo.modifiable or vim.bo.readonly then
        return ""
      end
    end,
    hl = { fg = "orange" },
  },
}

-- Now, let's say that we want the filename color to change if the buffer is
-- modified. Of course, we could do that directly using the FileName.hl field,
-- but we'll see how easy it is to alter existing components using a "modifier"
-- component

local FileNameModifer = {
  hl = function()
    if vim.bo.modified then
      -- use `force` because we need to override the child's hl foreground
      return { fg = "#e0def4", bold = true, force = true }
    end
  end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(
  FileNameBlock,
  FileIcon,
  utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
  unpack(FileFlags), -- A small optimisation, since their parent does nothing
  { provider = "%<" } -- this means that the statusline is cut here when there's not enough space
)

local FileType = {
  provider = function()
    return string.upper(vim.bo.filetype)
  end,
  hl = { fg = "#d0c9f0",  bold = true },
  -- hl = { fg = utils.get_highlight("Type").fg, bold = true },
}

local FileEncoding = {
  provider = function()
    local enc = (vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc -- :h 'enc'
    return enc ~= "utf-8" and enc:upper()
  end,
}

local FileFormat = {
  provider = function()
    local fmt = vim.bo.fileformat
    return fmt ~= "unix" and fmt:upper()
  end,
}

local FileSize = {
  provider = function()
    -- stackoverflow, compute human readable file size
    local suffix = { "b", "k", "M", "G", "T", "P", "E" }
    local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
    fsize = (fsize < 0 and 0) or fsize
    if fsize < 1024 then
      return fsize .. suffix[1]
    end
    -- local i = math.floor((math.log(fsize) / math.log(1024)))
    -- return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
  end,
}

local FileLastModified = {
  -- did you know? Vim is full of functions!
  provider = function()
    local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
    return (ftime > 0) and os.date("%c", ftime)
  end,
}

-- I take no credits for this! :lion:
local ScrollBar = {
  static = {
    sbar = { "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
    -- Another variant, because the more choice the better.
    -- sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' }
  },
  provider = function(self)
    local curr_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)
    local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
    return string.rep(self.sbar[i], 2)
  end,
  hl = { fg = "#eb6f92", bg = "#232136" },
  -- hl = { fg = "blue", bg = "bright_bg" },
}

local WorkDir = {
  provider = function()
    local icon = (vim.fn.haslocaldir(0) == 1 and "l" or "g") .. " " .. " "
    local cwd = vim.fn.getcwd(0)
    cwd = vim.fn.fnamemodify(cwd, ":~")
    if not conditions.width_percent_below(#cwd, 0.25) then
      cwd = vim.fn.pathshorten(cwd)
    end
    local trail = cwd:sub(-1) == "/" and "" or "/"
    return icon .. cwd .. trail
  end,
  hl = { fg = "blue", bold = true },
}

local Align = { provider = "%=" }
local Space = { provider = " " }
local Sepp = { provider = " · " }

ViMode = utils.surround({ "", "" }, "#44415a", { ViMode })
FileNameBlock = utils.surround({ "", " " }, "#44415a", { FileNameBlock })
FileTypeScroll = utils.surround({ "", "" }, "#44415a", { FileType, Sepp, ScrollBar })
FileType = utils.surround({ "", "" }, "#44415a", { FileType })
local DefaultStatusline = {
  ViMode,
  Space,
  FileNameBlock,
  Space,
  -- WorkDir,
  Align,
  Align,
  Space,
  Space,
  Space,
  FileTypeScroll,
  -- Space,
  -- Space,
  -- ScrollBar,
}

local InactiveStatusline = {
  condition = function()
    return not conditions.is_active()
  end,

  Align,
  FileTypeScroll,
  -- Space,
  -- FileNameBlock,
  -- Align,
}

local SpecialStatusline = {
  condition = function()
    return conditions.buffer_matches {
      buftype = { "nofile", "prompt", "help", "quickfix" },
      filetype = { "^git.*", "fugitive" },
    }
  end,

  FileType,
  Space,
  Align,
}

local StatusLines = {

  hl = function()
    if conditions.is_active() then
      return "StatusLine"
    else
      return "StatusLineNC"
    end
  end,

  init = utils.pick_child_on_condition,

  SpecialStatusline,
  InactiveStatusline,
  DefaultStatusline,
}

-- local StatusLines = {
--
--   ...,
--
--   static = {
--     mode_colors = {
--       n = "red",
--       i = "green",
--       v = "cyan",
--       V = "cyan",
--       ["\22"] = "cyan",
--       c = "orange",
--       s = "purple",
--       S = "purple",
--       ["\19"] = "purple",
--       R = "orange",
--       r = "orange",
--       ["!"] = "red",
--       t = "green",
--     },
--     mode_color = function(self)
--       local mode = conditions.is_active() and vim.fn.mode() or "n"
--       return self.mode_colors[mode]
--     end,
--   },
-- }
--
-- local ViMode = {
--   static = {
--     mode_names = { ... },
--   },
--   provider = function(self)
--     return " %2(" .. self.mode_names[vim.fn.mode(1)] .. "%)"
--   end,
--   hl = function(self)
--     local color = self:mode_color() -- here!
--     return { fg = color, bold = true }
--   end,
-- }
--
-- utils.surround({ "", "" }, function(self)
--   return self:mode_color()
-- end)

require("heirline").setup(StatusLines)
