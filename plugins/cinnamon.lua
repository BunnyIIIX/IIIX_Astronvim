local map = require("user.utils").map
-- local map = vim.set.map
-- local unmap = vim.keymap.del

-- Activating Cinnamon:
require("cinnamon").setup {
	--> Keymap
	default_keymaps = false, -- Create default keymaps.
	extra_keymaps = false,
	extended_keymaps = false,

	-- OPTIONS:
	always_scroll = false, -- Scroll the cursor even when the window hasn't scrolled.
	centered = true, -- Keep cursor centered in window when using window scrolling.
	default_delay = 11, -- The default delay (in ms) between each line when scrolling.
	horizontal_scroll = false, -- Enable smooth horizontal scrolling when view shifts left or right.
	scroll_limit = 300, -- Max number
}

--=> Unmap keymap
-- unmap({ "n", "x" }, "0")
-- unmap({ "n", "x" }, "^")
-- unmap({ "n", "x" }, "$")

--=> CUSTOM KEYMAPS
-- Half-window movements:
map({ "n", "x" }, "<M-Up>", "<Cmd>lua Scroll('<C-u>', 0, 1, 5)<CR>")
map({ "n", "x" }, "<M-Down>", "<Cmd>lua Scroll('<C-d>', 0, 1, 5)<CR>")

-- Page movements:
-- map({ "n", "x" }, "<C-Up>", "<Cmd>lua Scroll('<C-b>', 1, 1)<CR>")
-- map({ "n", "x" }, "<C-Down>", "<Cmd>lua Scroll('<C-f>', 1, 1)<CR>")
map({ "n", "x" }, "<PageUp>", "<Cmd>lua Scroll('<C-b>', 0, 1, 5)<CR>")
map({ "n", "x" }, "<PageDown>", "<Cmd>lua Scroll('<C-f>', 0, 1, 5)<CR>")

--=> EXTRA_KEYMAPS:
-- Start/end of file and line number movements:
map({ "n", "x" }, "gg", "<Cmd>lua Scroll('gg', 0, 3, 3)<CR>")
map({ "n", "x" }, "G", "<Cmd>lua Scroll('G', 0, 3, 3)<CR>")

-- Paragraph movements:
map({ "n", "x" }, "(", "<Cmd>lua Scroll('{')<CR>")
map({ "n", "x" }, ")", "<Cmd>lua Scroll('}')<CR>")

-- Previous/next search result:
map("n", "n", "<Cmd>lua Scroll('n', 0, 3, 3)<CR>")
map("n", "N", "<Cmd>lua Scroll('N', 0, 3, 3)<CR>")
map("n", "*", "<Cmd>lua Scroll('*', 0, 3, 3)<CR>")
map("n", "#", "<Cmd>lua Scroll('#', 0, 3, 3)<CR>")
map("n", "g*", "<Cmd>lua Scroll('g*', 1)<CR>")
map("n", "g#", "<Cmd>lua Scroll('g#', 1)<CR>")

-- Previous/next cursor location:
-- map("n", "<M-o>", "<Cmd>lua Scroll('<C-o>', 1)<CR>")
-- map("n", "<M-i>", "<Cmd>lua Scroll('1<C-i>', 1)<CR>")

-- Horizontal screen scrolling:
-- map("n", "zh", "<Cmd>lua Scroll('zH')<CR>")
-- map("n", "zl", "<Cmd>lua Scroll('zL')<CR>")
-- map("n", "zs", "<Cmd>lua Scroll('zs')<CR>")
-- map("n", "ze", "<Cmd>lua Scroll('ze')<CR>")
-- map("n", "zh", "<Cmd>lua Scroll('zh', 0, 1)<CR>")
-- map("n", "zl", "<Cmd>lua Scroll('zl', 0, 1)<CR>")

-- Screen scrolling:
-- map("n", "zz", "<Cmd>lua Scroll('zz', 0, 1)<CR>")
-- map("n", "zt", "<Cmd>lua Scroll('zt', 0, 1)<CR>")
-- map("n", "zb", "<Cmd>lua Scroll('zb', 0, 1)<CR>")
-- map("n", "z.", "<Cmd>lua Scroll('z.', 0, 1)<CR>")
-- map("n", "z<CR>", "<Cmd>lua Scroll('zt^', 0, 1)<CR>")
-- map("n", "z-", "<Cmd>lua Scroll('z-', 0, 1)<CR>")
-- map("n", "z^", "<Cmd>lua Scroll('z^', 0, 1)<CR>")
-- map("n", "z+", "<Cmd>lua Scroll('z+', 0, 1)<CR>")
-- map("n", "<C-y>", "<Cmd>lua Scroll('<C-y>', 0, 1)<CR>")
-- map("n", "<C-e>", "<Cmd>lua Scroll('<C-e>', 0, 1)<CR>")

-- Start/end of line:
-- map({ "n", "x" }, "0", "<Cmd>lua Scroll('0')<CR>")
-- map({ "n", "x" }, "^", "<Cmd>lua Scroll('^')<CR>")
-- map({ "n", "x" }, "$", "<Cmd>lua Scroll('$', 0, 1)<CR>")

--> EXTENDED_KEYMAPS:
-- Up/down movements:
-- map({ "n", "x" }, "k", "<Cmd>lua Scroll('k', 0, 1, 3, 0)<CR>")
-- map({ "n", "x" }, "j", "<Cmd>lua Scroll('j', 0, 1, 3, 0)<CR>")
-- map({ "n", "x" }, "<Up>", "<Cmd>lua Scroll('k', 0, 1, 3, 0)<CR>")
-- map({ "n", "x" }, "<Down>", "<Cmd>lua Scroll('j', 0, 1, 3, 0)<CR>")

-- Left/right movements:
-- map({ "n", "x" }, "h", "<Cmd>lua Scroll('h', 0, 1, 3, 0)<CR>")
-- map({ "n", "x" }, "l", "<Cmd>lua Scroll('l', 0, 1, 3, 0)<CR>")
-- map({ "n", "x" }, "<Left>", "<Cmd>lua Scroll('h', 0, 1, 3, 0)<CR>")
-- map({ "n", "x" }, "<Right>", "<Cmd>lua Scroll('l', 0, 1, 3, 0)<CR>")

--> LSP_KEYMAPS:
-- LSP go-to-definition:
map("n", "gd", "<Cmd>lua Scroll('definition')<CR>")

-- LSP go-to-declaration:
map("n", "gD", "<Cmd>lua Scroll('declaration')<CR>")
