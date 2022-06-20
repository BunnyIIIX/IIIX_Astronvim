return {
  ["goolord/alpha-nvim"] = { disable = true },
  ["lukas-reineke/indent-blankline.nvim"] = { disable = true },
  ["max397574/better-escape.nvim"] = { disable = true },
  -- ["numToStr/Comment.nvim"] = { opt = false },

  --{{{=> Telescope
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require "user.plugins.telescope"
      require("telescope").load_extension "notify"
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.file_browser",
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  },
  {
    "nvim-telescope/telescope-hop.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.hop",
    config = function()
      require("telescope").load_extension "hop"
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.project",
    config = function()
      require("telescope").load_extension "project"
    end,
  },
  {
    "benfowler/telescope-luasnip.nvim",
    after = "telescope.nvim",
    module = "telescope._extensions.luasnip",
    config = function()
      require("telescope").load_extension "luasnip"
    end,
  },

  --   "nvim-telescope/telescope-bibtex.nvim",
  --   after = "telescope.nvim",
  --   config = function()
  --     require("telescope").load_extension "bibtex"
  --   end,
  -- },
  -- {
  --   "nvim-telescope/telescope-media-files.nvim",
  --   after = "telescope.nvim",
  --   config = function()
  --     require("telescope").load_extension "media_files"
  --   end,
  -- },
  --}}}

  --{{{=> Code Easily
  --{{{=> Cmp
  {
    "hrsh7th/cmp-calc",
    after = "nvim-cmp",
    config = function()
      require("core.utils").add_user_cmp_source "calc"
    end,
  },
  {
    "hrsh7th/cmp-emoji",
    after = "nvim-cmp",
    config = function()
      require("core.utils").add_user_cmp_source "emoji"
    end,
  },
  {
    "hrsh7th/cmp-cmdline",
    after = "nvim-cmp",
    config = function()
      require "user.plugins.cmdline"
      require("core.utils").add_user_cmp_source "cmdline"
    end,
  },
  -- ["jc-doyle/cmp-pandoc-references"] = {
  --   after = "nvim-cmp",
  --   config = function()
  --     require("core.utils").add_user_cmp_source "pandoc_references"
  --   end,
  -- },
  -- ["kdheepak/cmp-latex-symbols"] = {
  --   after = "nvim-cmp",
  --   config = function()
  --     require("core.utils").add_user_cmp_source "latex_symbols"
  --   end,
  -- },
  --}}}

  --{{{=> Lsp
  { "nanotee/sqls.nvim", module = "sqls", after = "nvim-lspconfig" },
  --}}}

  --{{{=> Jumper
  {
    "phaazon/hop.nvim",
    branch = "v1",
    cmd = {
      "HopChar1CurrentLine",
      "HopChar2",
      "HopWord",
      "HopLine",
    },
    config = function()
      require("hop").setup()
    end,
  },
  -- ["ggandor/lightspeed.nvim"] = {},
  --}}}

  { "machakann/vim-sandwich" },
  -- Highlight, navigate, and operate on sets of matching text
  { "andymass/vim-matchup", after = "nvim-treesitter" },
  -- Easily Create Table
  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
    setup = function()
      vim.g.table_mode_corner = "|"
    end,
  },
  -- ["windwp/nvim-autopairs"] = {},
  -- ["tpope/vim-repeat"] = {},
  --}}}

  --{{{=> Syntax / Colorscheme
  { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
  -- ["ziontee113/syntax-tree-surfer"] = { module = "syntax-tree-surfer" },
  {
    "rose-pine/neovim",
    as = "rose-pine",
    config = function()
      vim.g.rose_pine_variant = "moon"
      require "user.theme.rose-pine"
      -- vim.cmd "colorscheme rose-pine"
    end,
  },
  -- {
  --   "EdenEast/nightfox.nvim",
  --   config = function()
  --     require("nightfox").setup(require "user.plugins.nightfox")
  --   end,
  -- },
  --}}}

  --{{{=> UI
  ["declancm/cinnamon.nvim"] = { disable = false },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    module = "zen-mode",
    config = function()
      require("zen-mode").setup(require "user.plugins.zen-mode")
    end,
  },
  -- {
  --   "ellisonleao/glow.nvim",
  --   cmd = "Glow",
  --   module = "glow",
  --   setup = function()
  --     vim.g.glow_border = "rounded"
  --   end,
  -- },
  --=> Status-Line
  ["feline-nvim/feline.nvim"] = {
    setup = function()
      require("feline").setup()
      -- require("feline").use_theme(my_theme)
      -- require("user.theme.sacr3d-moon")
    end,
    config = function()
      require "user.theme.sacr3d-moon"
    end,
  },
  --}}}

  --{{{=> Note/Wiki
  {
    "vimwiki/vimwiki",
    -- cmd = {
    --   "VimwikiIndex",
    --   "2VimwikiIndex",
    -- },
    -- config = function()
    --   require "user.plugins.vim-wiki"
    -- end,
    opt = false,
  },
  -- plain text note-taking assistant
  -- ["mickael-menu/zk-nvim"] = {
  --   module = { "zk", "zk.commands" },
  --   config = function()
  --     require("zk").setup(require "user.plugins.zk")
  --   end,
  -- },
  -- ["vitalk/vim-simple-todo"] = {
  --   keys = {
  --     "<Plug>(simple-todo-above)",
  --     "<Plug>(simple-todo-below)",
  --     "<Plug>(simple-todo-mark-as-done)",
  --     "<Plug>(simple-todo-mark-as-undone)",
  --     "<Plug>(simple-todo-mark-switch)",
  --     "<Plug>(simple-todo-new-list-item)",
  --     "<Plug>(simple-todo-new-list-item-start-of-line)",
  --   },
  --   setup = function()
  --     vim.g.simple_todo_map_keys = false
  --   end,
  -- },
  --}}}

  --{{{=> Debug
  -- ["mfussenegger/nvim-dap"] = {
  --   module = "dap",
  --   config = require "user.plugins.dap",
  -- },
  -- ["rcarriga/nvim-dap-ui"] = {
  --   after = "nvim-dap",
  --   config = function()
  --     local dap, dapui = require "dap", require "dapui"
  --     dapui.setup(require "user.plugins.dapui")
  --     -- add listeners to auto open DAP UI
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end,
  -- },
  --}}}

  --{{{=> Misc
  -- -- Collection of minimal, independent, and fast Lua modules
  -- ["echasnovski/mini.nvim"] = {
  --   event = "VimEnter",
  --   config = function()
  --     require "user.plugins.mini"()
  --   end,
  -- },
  --
  -- -- Reopen files at last edit position
  -- ["ethanholz/nvim-lastplace"] = {
  --   event = "BufRead",
  --   config = function()
  --     require("nvim-lastplace").setup(require "user.plugins.nvim-lastplace")
  --   end,
  -- },
  --
  -- -- Highlights for text filetypes, like markdown
  -- ["lukas-reineke/headlines.nvim"] = {
  --   ft = { "markdown", "rmd" },
  --   config = function()
  --     require("headlines").setup(require "user.plugins.headlines")
  --   end,
  -- },
  -- ["jbyuki/nabla.nvim"] = {
  --   module = "nabla",
  -- },
  -- ["danymat/neogen"] = {
  --   module = "neogen",
  --   cmd = "Neogen",
  --   config = function()
  --     require("neogen").setup(require "user.plugins.neogen")
  --   end,
  --   requires = "nvim-treesitter/nvim-treesitter",
  -- },
  -- ["mtikekar/nvim-send-to-term"] = {
  --   cmd = "SendHere",
  --   setup = function()
  --     vim.g.send_disable_mapping = true
  --   end,
  -- },
  -- { "skywind3000/asyncrun.vim", cmd = "AsyncRun" },
  -- ["wakatime/vim-wakatime"] = {
  --   opt = true,
  --   setup = function()
  --     require("core.utils").defer_plugin "vim-wakatime"
  --   end,
  -- },
  --}}}

}
