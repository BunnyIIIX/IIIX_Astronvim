return {
  -- first key is the mode
  n = {
    --=> Next buffer
    ["<Tab>"] = { ":bn<CR>", desc = "Next Tab" },
    --=> Navigation between windows
    ["<C-Left>"] = "<C-w>h",
    ["<C-Right>"] = "<C-w>l",
    ["<C-Up>"] = "<C-w>k",
    ["<C-Down>"] = "<C-w>j",
    --=> Comment
    ["<M-/>"] = {
      "<Cmd>lua require('Comment.api').call('toggle_current_blockwise_op')<CR>g@$",
      desc = "Comment Block",
    },
    --=> Hop
    f = { ":HopChar1CurrentLine<cr>", desc = "Hop 1 Char Current Line" },
    F = { ":HopChar1<cr>", desc = "Hop 1 Char Whole Buf" },
    --=> VimWiki
    ["<space>w"] = ":1VimwikiIndex<CR>",
    ["<space>ww"] = ":2VimwikiIndex<CR>",
    ["<space><Down>"] = ":VimwikiNextLink<CR>",
    ["<space><Up>"] = ":VimwikiPrevLink<CR>",
    --=> Sacr3d Functions
    ["<M-\\>"] = {
      "<cmd>w <CR> | :Sacr3dReloadSync <CR> | <cmd>echo 'SyncReloaded!'<CR>",
      desc = "Sacr3dReloadSync",
    },
    ["<M-Enter>"] = { "<cmd>w <CR> | <cmd>Sacr3dReload <CR> | <cmd>echo 'Reloaded!'<CR>", desc = "Sacr3dReload" },
    --=> Line Manipulation
    ["<A-Up>"] = { ":m .-2<CR>", desc = "move line up" },
    ["<A-Down>"] = { ":m .+1<CR>", desc = "move line down" },
    --=> Misc
    ["n"] = "nzzzv",
    ["N"] = "Nzzzv",
    ["J"] = "mzJ`z",
    --> Use ESC to turn off search highlighting
    ["<Esc>"] = { "<cmd>nohlsearch<Bar>:echo 'hlsearch OFF!'<CR>", desc = "Toggle Higlight" },
    -- ["<Esc>"] = { ":set nohlsearch!<CR>", desc = "Toggle Higlight" },
  },

  --=> Visual Mode
  v = {
    --=> Comment
    ["<Space>/>"] = { "<Cmd>lua require('Comment.api').call('toggle_linewise_op')<CR>g@", desc = "Comment" },
    ["<M-/>"] = { "<Cmd>lua require('Comment.api').call('toggle_blockwise_op')<CR>g@", desc = "Comment Block" },
    ["<A-Up>"] = ":m '<-2<cr>gv=gv",
    ["<A-Down>"] = ":m '>+1<cr>gv=gv",
    --=> Don't copy the replaced text after pasting in visual mode
    ["p"] = "p:let @+=@0<CR>",
  },

  --=> Insert Mode
  i = {
    --=> Move cursor within insert mode
    ["<C-Left>"] = "<Left>",
    ["<C-e>"] = "<End>",
    ["<C-Right>"] = "<Right>",
    ["<C-Down>"] = "<Down>",
    ["<C-Up>"] = "<Up>",
    ["<C-a>"] = "<ESC>^i",
    [","] = ",<c-g>u",
    ["."] = ".<c-g>u",
    ["!"] = "!<c-g>u",
    ["?"] = "?<c-g>u",
  },

  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
