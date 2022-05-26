local map = vim.keymap.set

-- vim.cmd('source ~/.config/nvim/lua/user/config/vim-wiki/vimwiki.vim')

--{{{ =>> HIGHLIGHT <<=--
---------------------
-- vim.cmd('hi vimwikibold      gui=bold guifg=#FFFFFF guibg=none guisp=none')
-- vim.cmd('hi VimwikiHeader1   guifg=#a957ec')
-- vim.cmd('hi VimwikiHeader2   guifg=#a6e22e')
-- vim.cmd('hi VimwikiHeader3   guifg=#ff5c57')
-- vim.cmd('hi VimwikiHeader4   guifg=#F01f6f')
-- vim.cmd('hi VimwikiHeader5   guifg=#268bd2')
-- vim.cmd('hi VimwikiHeader6   guifg=#81eeb2')
-- vim.cmd('hi markdownH1       gui=bold guifg=#a957ec')
-- vim.cmd('hi markdownH2       gui=bold guifg=#a6e22e')
-- vim.cmd('hi markdownH3       gui=bold guifg=#ff5c57')
-- vim.cmd('hi markdownH4       gui=bold guifg=#F01f6f')
-- vim.cmd('hi markdownH5       gui=bold guifg=#268bd2')
-- vim.cmd('hi markdownH6       gui=bold guifg=#81eeb2')
--}}}

--{{{ =>> MAPPINGS <<=
map("n", "<space>w", ":1VimwikiIndex<CR>", { noremap = true, silent = true })
map("n", "2<space>w", ":2VimwikiIndex<CR>", { noremap = true, silent = true })
map("n", "<space><Down>", ":VimwikiNextLink<CR>", { noremap = true, silent = true })
map("n", "<space><Up>", ":VimwikiPrevLink<CR>", { noremap = true, silent = true })
-- map('n', '<M-Right>', '<Plug>VimwikiIncreaseLvlSingleItem', { noremap = true, silent = true })
-- map('i', '<M-Right>', '<Plug>VimwikiIncreaseLvlSingleItem', { noremap = true, silent = true })
-- map('n', '<M-Left>', '<Plug>VimwikiDecreaseLvlSingleItem', { noremap = true, silent = true })
-- map('i', '<M-Left>', '<Plug>VimwikiDecreaseLvlSingleItem', { noremap = true, silent = true })
-- map('n', '<M-}>', '<Plug>VimwikiIncreaseLvlWholeItem', { noremap = true, silent = true })
-- map('i', '<M-}>', '<Plug>VimwikiIncreaseLvlWholeItem', { noremap = true, silent = true })
-- map('n', '<M-{>', '<Plug>VimwikiDecreaseLvlWholeItem', { noremap = true, silent = true })
-- map('i', '<M-{>', '<Plug>VimwikiDecreaseLvlWholeItem', { noremap = true, silent = true })
--}}}

-- vim: foldmethod=marker :
