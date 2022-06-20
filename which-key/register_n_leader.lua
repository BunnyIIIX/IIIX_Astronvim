local mode = function(mode)
  return require("user.which-key.mode." .. mode)
end

return {
  -- n = mode "n",
  -- v = mode "v",
  -- i = mode "i",

  ["q"] = { "<cmd>bd<CR>", "Bye Buffer" },
  ["c"] = { "<cmd>bd!<CR>", "Close Buffer" },
  -- ["n"] = { "<cmd>tabnew<cr>", "New Buffer" },
  ["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" },
  ["<cr>"] = { '<esc>/<++><cr>"_c4l', "Next Template" },
  ["/"] = { "<cmd>lua require('Comment.api').call('toggle_current_linewise_op')<CR>g@$", "Comment" },
  ["."] = { "<cmd>ColorizerToggle<cr>", "Colorizer" },
  ["<Space>"] = { "za", "Fold/UnFold" },
  j = {
    name = "Hop",
    c = { "<cmd>HopChar1<cr>", "Character" },
    C = { "<cmd>HopChar2<cr>", "2 Characters" },
    l = { "<cmd>HopLine<cr>", "Line" },
    p = { "<cmd>HopPattern<cr>", "Pattern" },
    j = { "<cmd>HopWord<cr>", "Word" },
  },

  f = {
    name = "Telescope",
    ["?"] = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    ["'"] = { "<cmd>Telescope marks<cr>", "Marks" },
    b = { "<cmd>Telescope file_browser hidden=true grouped=true theme=ivy<cr>", "Explorer" },
    f = { "<cmd>Telescope find_files hidden=true no_ignore=true theme=dropdown<cr>", "All Files" },
    o = { "<cmd>Telescope oldfiles<cr>", "History" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    M = { "<cmd>Telescope media_files<cr>", "Media" },
    -- n = { "<cmd>Telescope notify<cr>", "Notifications" },
    n = { "<cmd>lua require('telescope').extensions.notify.notify()<cr>", "Notifications" },
    p = { "<cmd>Telescope project<cr>", "Projects" },
    r = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope colorscheme<cr>", "Themes" },
    g = { "<cmd>Telescope live_grep<cr>", "Words" },
    -- B = { "<cmd>Telescope bibtex<cr>", "BibTeX" },
    -- c = { "<cmd>Telescope commands<cr>", "Commands" },
    -- o = { nil },
  },
  g = {
    name = "Telescope Git",
    m = { "<cmd>Telescope git_commits<CR>", "Git Commits" },
    t = { "<cmd>Telescope git_status<CR>", "Git Status" },
  },
  ["]"] = {
    f = "Next function start",
    x = "Next class start",
    F = "Next function end",
    X = "Next class end",
  },
  ["["] = {
    f = "Previous function start",
    x = "Previous class start",
    F = "Previous function end",
    X = "Previous class end",
  },
}

--     i = {
--       ["<c-d>"] = {
--         n = { "<c-r>=strftime('%Y-%m-%d')<cr>", "Y-m-d" },
--         x = { "<c-r>=strftime('%m/%d/%y')<cr>", "m/d/y" },
--         f = { "<c-r>=strftime('%B %d, %Y')<cr>", "B d, Y" },
--         X = { "<c-r>=strftime('%H:%M')<cr>", "H:M" },
--         F = { "<c-r>=strftime('%H:%M:%S')<cr>", "H:M:S" },
--         d = { "<c-r>=strftime('%Y/%m/%d %H:%M:%S -')<cr>", "Y/m/d H:M:S -" },
--       },
--     },
--
--     v = {
--       ["<leader>"] = {
--         ["/"] = "Comment",
--
--         h = {
--           name = "Hop",
--           c = { "<cmd>HopChar1<cr>", "Character" },
--           C = { "<cmd>HopChar2<cr>", "2 Characters" },
--           l = { "<cmd>HopLine<cr>", "Line" },
--           p = { "<cmd>HopPattern<cr>", "Pattern" },
--           w = { "<cmd>HopWord<cr>", "Word" },
--         },
--
--         n = {
--           name = "Notes",
--           s = { ":'<,'>lua require('zk.commands').get('ZkMatch')()<cr>", "Search" },
--           n = {
--             ":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'personal' })<cr>",
--             "New Personal Note From Title",
--           },
--           N = {
--             ":'<,'>lua require('zk.commands').get('ZkNewFromTitleSelection')({ dir = 'work' })<cr>",
--             "New Work Note From Title",
--           },
--           W = {
--             ":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'work', title = vim.fn.input('Title: ') })<cr>",
--             "New Work Note From Content",
--           },
--           C = {
--             ":'<,'>lua require('zk.commands').get('ZkNewFromContentSelection')({ dir = 'personal', title = vim.fn.input('Title: ') })<cr>",
--             "New Personal Note From Content",
--           },
--           x = { "<Plug>(simple-todo-mark-as-done)", "Mark Done" },
--           X = { "<Plug>(simple-todo-mark-as-undone)", "Mark Undone" },
--           ["<tab>"] = { "<Plug>(simple-todo-mark-switch)", "Toggle Todo" },
--         },
--       },
--     },
--   },
-- }
