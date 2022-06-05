-->> {{{ Helpers
local opt = { noremap = true, silent = true }
local map = vim.keymap.set
-- local delmap = vim.keymap.del
-- local is_available = astronvim.is_available
--}}}

-->> {{{ Remove default bindings
-- delmap("n", "<C-d>")
-- delmap("n", "<C-Down>")
-- delmap("n", "<C-Left>")
-- delmap("n", "<C-Right>")
-- delmap("n", "<C-Up>")
-- delmap("n", "<C-q>")
-- delmap("n", "<C-s>")
-- delmap("n", "<leader>c")
-- delmap("n", "<leader>h")
-- delmap("n", "<leader>w")
--> Telescope
-- if is_available "telescope.nvim" then
  -- delmap("n", "<leader>fh")
  -- delmap("n", "<leader>fm")
  -- delmap("n", "<leader>fn")
  -- delmap("n", "<leader>fo")
  -- delmap("n", "<leader>sb")
  -- delmap("n", "<leader>sc")
  -- delmap("n", "<leader>sh")
  -- delmap("n", "<leader>sk")
  -- delmap("n", "<leader>sm")
  -- delmap("n", "<leader>sn")
  -- delmap("n", "<leader>sr")
-- end
--}}}

--{{{>> Smart, Smooth, Sane Keymap
--> Save & Reload.
map("n", "<M-\\>", ':w <CR> | :Sacr3dReloadSync<CR> | :echo "Sync & Reloaded"<CR>', { noremap = true, silent = true })
map("n", "<M-Enter>", ':w <CR> | :Sacr3dReload<CR> | :echo "Saved & Reloaded"<CR>', { noremap = true, silent = true })

--> Close buffer
-- map("n", "<space>q", ":bd<cr>", { desc = "Close Buffer" }, opt)
-- map("n", "<space>c", ":bd!<cr>", { desc = "Force Close Buffer" }, opt)

--> Next buffer
map("n", "<Tab>", ":bn<cr>", { desc = "Next Tab" }, opt)

--> Open/Close Fold
-- map("n", "<space><space>", "za", { desc = "Open/Close Fold" }, opt)

--> Don't copy the replaced text after pasting in visual mode
map("v", "p", "p:let @+=@0<CR>")

--> Use ESC to turn off search highlighting
map("n", "<Esc>", ":nohlsearch<Bar>:echo<CR>", { desc = "Toggle Higlight" }, opt)
-- map("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", opt)

--> Navigation between windows
map("n", "<C-Left>", "<C-w>h")
map("n", "<C-Right>", "<C-w>l")
map("n", "<C-Up>", "<C-w>k")
map("n", "<C-Down>", "<C-w>j")

-- Move cursor within insert mode
map("i", "<C-Left>", "<Left>")
map("i", "<C-e>", "<End>")
map("i", "<C-Right>", "<Right>")
map("i", "<C-Down>", "<Down>")
map("i", "<C-Up>", "<Up>")
map("i", "<C-a>", "<ESC>^i")

--}}}

--{{{>> Telescope
-- map("n", "<leader>ff", "<cmd> :Telescope find_files <CR>", { desc = "FindFiles" }, opt)
-- map(
--   "n",
--   "<leader>fa",
--   "<cmd> :Telescope find_files follow=true no_ignore=true hidden=true <CR>",
--   { desc = "FindFiles" },
--   opt
-- )
-- map("n", "<leader>fg", "<cmd> :Telescope live_grep <CR>", { desc = "LiveGrep" }, opt)
-- map("n", "<leader>fb", "<cmd> :Telescope file_browser <CR>", { desc = "FileBrowser" }, opt)
-- map("n", "<leader>fB", "<cmd> :Telescope buffers <CR>", { desc = "Buffers" }, opt)
-- map("n", "<leader>fh", "<cmd> :Telescope help_tags <CR>", { desc = "HelpTags" }, opt)
-- map("n", "<leader>fo", "<cmd> :Telescope oldfiles <CR>", { desc = "OldFiles" }, opt)
-- map("n", "<leader>gm", "<cmd> :Telescope git_commits <CR>", { desc = "Git Commits" }, opt)
-- map("n", "<leader>gt", "<cmd> :Telescope git_status <CR>", { desc = "Git Status" }, opt)
-- map("n", "<leader>th", "<cmd> :Telescope themes <CR>", { desc = "Toggle Higlight" }, opt)
--}}}

--{{{>> Misc
--> Comment
-- map(
--   "n",
--   "<Space>/",
--   "<Cmd>lua require('Comment.api').call('toggle_current_linewise_op')<CR>g@$",
--   { desc = "Comment" },
--   opt
-- )
map(
  "n",
  "<M-/>",
  "<Cmd>lua require('Comment.api').call('toggle_current_blockwise_op')<CR>g@$",
  { desc = "Comment Block" },
  opt
)
map("v", "<Space>/", "<Cmd>lua require('Comment.api').call('toggle_linewise_op')<CR>g@", { desc = "Comment" }, opt)
map("v", "<M-/>", "<Cmd>lua require('Comment.api').call('toggle_blockwise_op')<CR>g@", { desc = "Comment Block" }, opt)

--> Colorizer
-- map("n", "<leader>.", ":ColorizerToggle<cr>", opt)
--}}}

--{{{>> Nvim-Tree
-- map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
-- map("n", "<leader>r", ":NvimTreeRefresh<CR>", opt)
-- map("n", "<C-n>", ":NvimTreeToggle<CR>", opt)
--}}}

-- vim: foldmethod=marker: ft=lua:
