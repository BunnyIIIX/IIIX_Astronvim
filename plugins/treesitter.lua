return {
  ensure_installed = {
    "bash",
    "vim",
    "yaml",
    "toml",
    "markdown",
    "python",
    "lua",
    "json",
    "html",
    -- "bibtex",
    -- "c",
    -- "cmake",
    -- "comment",
    -- "cpp",
    -- "css",
    -- "dockerfile",
    -- "go",
    -- "haskell",
    -- "http",
    -- "javascript",
    -- "julia",
    -- "latex",
    -- "make",
    -- "r",
    -- "regex",
    -- "tsx",
    -- "typescript",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autopairs = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    disable = { "html", "markdown", "vimwiki" },
    extended_mode = false,
    max_file_lines = nil,
  },
  autotag = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ax"] = "@class.outer",
        ["ix"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = "@function.outer",
        ["]x"] = "@class.outer",
      },
      goto_next_end = {
        ["]F"] = "@function.outer",
        ["]X"] = "@class.outer",
      },
      goto_previous_start = {
        ["[f"] = "@function.outer",
        ["[x"] = "@class.outer",
      },
      goto_previous_end = {
        ["[F"] = "@function.outer",
        ["[X"] = "@class.outer",
      },
    },
    swap = {
      enable = false,
    },
  },
}
