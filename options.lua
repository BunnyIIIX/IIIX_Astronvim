return {
  opt = {
    -- Indentation
    backspace = { "eol", "start", "indent" },
    clipboard = "unnamedplus",
    encoding = "utf-8",
    matchpairs = { "(:)", "{:}", "[:]", "<:>" },
    syntax = "enable",

    -- indention
    autoindent = true,
    expandtab = true,
    shiftwidth = 2,
    softtabstop = 2,
    tabstop = 2,
    smartindent = true,

    -- search
    hlsearch = false,
    ignorecase = true,
    smartcase = true,
    wildignore = vim.opt.wildignore + { "*/node_modules/*", "*/.git/*", "*/vendor/*" },
    wildmenu = true,

    -- ui
    relativenumber = false,
    cursorline = true,
    laststatus = 2,
    mouse = "n",
    number = true,
    rnu = true,
    scrolloff = 18,
    showmode = false,
    sidescrolloff = 10, -- Lines to scroll horizontally
    splitbelow = true, -- Open new split below
    splitright = true, -- Open new split to the right
    wrap = false,
    list = true,
    listchars = {
      tab = "", -- →
      extends = "⟩",
      precedes = "⟨",
      trail = "·",
      nbsp = "␣",
    },
    -- listchars = {
    --   tab = " ", --> '❘-', '>-', ''
    --   trail = "·",
    --   lead = "", --> '', '·',
    --   extends = "»", --> '>'
    --   precedes = "«", --> '<'
    --   nbsp = "×", --> '%'
    --   -- eol = '<',
    -- },
    -- lazyredraw = true,
    -- signcolumn = 'yes'

    -- backups
    backup = false,
    swapfile = false,
    writebackup = false,
    undofile = false,

    -- autocomplete
    completeopt = { "menu", "menuone", "noselect" },
    shortmess = vim.opt.shortmess + { a = true, I = true },
    -- shortmess = vim.opt.shortmess + { c = true },

    -- perfomance
    redrawtime = 1500,
    timeoutlen = 250,
    ttimeoutlen = 10,
    updatetime = 100,

    -- theme
    termguicolors = true,
    conceallevel = 3, -- enable conceal
    foldenable = false,
    foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
    foldmethod = "marker",
    linebreak = true, -- linebreak soft wrap at words
    showbreak = "↪ ",
    spellfile = "~/.config/nvim/lua/user/spell/en.utf-8.add",
    thesaurus = "~/.config/nvim/lua/user/spell/mthesaur.txt",
  },
}
