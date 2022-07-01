--{{{=> Helper
local ls = require "luasnip"
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.lua"

local function cs(trigger, nodes, opts)
  local snippet = s(trigger, nodes)
  local target_table = snippets

  local pattern = file_pattern
  local keymaps = {}

  if opts ~= nil then
    -- check for custom pattern
    if opts.pattern then
      pattern = opts.pattern
    end

    -- if opts is a string
    if type(opts) == "string" then
      if opts == "auto" then
        target_table = autosnippets
      else
        table.insert(keymaps, { "i", opts })
      end
    end

    -- if opts is a table
    if opts ~= nil and type(opts) == "table" then
      for _, keymap in ipairs(opts) do
        if type(keymap) == "string" then
          table.insert(keymaps, { "i", keymap })
        else
          table.insert(keymaps, keymap)
        end
      end
    end

    -- set autocmd for each keymap
    if opts ~= "auto" then
      for _, keymap in ipairs(keymaps) do
        vim.api.nvim_create_autocmd("BufEnter", {
          pattern = pattern,
          group = group,
          callback = function()
            vim.keymap.set(keymap[1], keymap[2], function()
              ls.snip_expand(snippet)
            end, { noremap = true, silent = true, buffer = true })
          end,
        })
      end
    end
  end

  table.insert(target_table, snippet) -- insert snippet into appropriate table
end
--}}}

--{{{=> Start Refactoring

--> Set keybind
cs(
  "kbind",
  fmt('map("{}", "{}", "{}")', {
    i(1, "mode"),
    i(2, "key"),
    i(3, "commands"),
  })
)
--> Set keybind (with choice node)
cs(
  "kbinds",
  fmt([=[map({})]=], {
    c(1, {
      fmt([["n", "{}". "{}"]], {
        i(1, "key"),
        i(2, "commands"),
      }),
      fmt([["v", "{}". "{}"]], {
        i(1, "key"),
        i(2, "commands"),
      }),
    }),
  })
)

cs(
  "testtt",
  c(1, {
    t "some text", -- textNodes are just stopped at.
    i(nil, "some text"), -- likewise.
    -- sn(nil, {t"some text"}) -- this will not work!
    sn(nil, { i(1, "modee"), t "some text" }), -- this will.
  })
)

cs(
  "trig",
  c(1, {
    t "Ugh boring, a text node",
    i(nil, "At least I can edit something now..."),
    f(function(args)
      return "Still only counts as text!!"
    end, {}),
  })
)

--> single line vim.cmd
cs("cmd", fmt("vim.cmd[[{}]]", { i(1, "") }))
--> [CMD] multiline vim.cmd
cs("CMD", {
  t { "vim.cmd[[", "  " },
  i(1, ""),
  t { "", "]]" },
})

--> github import for packer
cs({
  trig = "https://github%.com/([%w-%._]+)/([%w-%._]+)!",
  regTrig = true,
  hidden = true,
}, {
  t [[use "]],
  f(function(_, snip)
    return snip.captures[1]
  end),
  t "/",
  f(function(_, snip)
    return snip.captures[2]
  end),
  t { [["]], "" },
  i(1, ""),
}, "auto")

--> {regexSnippet} LuaSnippet
cs(
  "regexSnippet",
  fmt(
    [=[
cs( -- {}
{{ trig = "{}", regTrig = true, hidden = true }}, fmt([[ 
{}
]], {{
  {}
}}))
      ]=],
    {
      i(1, "Description"),
      i(2, ""),
      i(3, ""),
      i(4, ""),
    }
  ),
  { pattern = "*/snippets/*.lua", "<C-d>" }
)

--> [luaSnippet] LuaSnippet
cs(
  "luaSnippet",
  fmt(
    [=[
cs("{}", fmt( -- {}
[[
{}
]], {{
  {}
  }}){})
    ]=],
    {
      i(1, ""),
      i(2, "Description"),
      i(3, ""),
      i(4, ""),
      c(5, {
        t "",
        fmt([[, "{}"]], { i(1, "keymap") }),
        fmt([[, {{ pattern = "{}", {} }}]], { i(1, "*/snippets/*.lua"), i(2, "keymap") }),
      }),
    }
  ),
  { pattern = "*/snippets/*.lua", "jcs" }
)

--> choice_node_snippet luaSnip choice node
cs(
  "choice_node_snippet",
  fmt(
    [[ 
c({}, {{ {} }}),
]],
    {
      i(1, ""),
      i(2, ""),
    }
  ),
  { pattern = "*/snippets/*.lua", "jcn" }
)

--> [function] Lua function snippet
cs(
  "function",
  fmt(
    [[ 
function {}({})
  {}
end
]],
    {
      i(1, ""),
      i(2, ""),
      i(3, ""),
    }
  ),
  "jff"
)

--> [local_function] Lua function snippet
cs(
  "local_function",
  fmt(
    [[ 
local function {}({})
  {}
end
]],
    {
      i(1, ""),
      i(2, ""),
      i(3, ""),
    }
  ),
  "jlf"
)

--> [local] Lua local variable snippet
cs(
  "local",
  fmt(
    [[ 
local {} = {}
  ]],
    { i(1, ""), i(2, "") }
  ),
  "jj"
)

-- Tutorial Snippets go here --

-- End Refactoring --

return snippets, autosnippets
