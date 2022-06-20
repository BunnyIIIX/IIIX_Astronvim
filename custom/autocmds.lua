if vim.fn.has "nvim-0.7" then
  local group = vim.api.nvim_create_augroup
  local aucmd = vim.api.nvim_create_autocmd
  local cmd = vim.api.nvim_create_user_command

  --=>> Sacr3d Commands
  cmd("Sacr3dReload", "lua require('user.utils').reload_user_config(true)", {})
  cmd("Sacr3dReloadSync", "lua require('user.utils').reload_user_config_sync()", {})
  cmd("LspFormat", "lua vim.lsp.buf.formatting()", {})

  --> Go to last loc when opening a buffer
  group("Sacr3d_lastPosition", { clear = true })
  aucmd("BufReadPost", {
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]],
    group = "Sacr3d_lastPosition",
  })

  --> Highlight on yank
  group("Sacr3d_yankHighlight", { clear = true })
  aucmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = "Sacr3d_yankHighlight",
  })

  -- don't auto comment new line
  aucmd("BufEnter", { command = [[set formatoptions-=cro]] })

  -- --> Auto Resize Window
  -- group("Sacr3d_Auto_Resize", { clear = true })
  -- aucmd("VimResized", {
  --   pattern = "*",
  --   command = "tabdo wincmd =",
  --   group = "Sacr3d_Auto_Resize",
  -- })

  -- vim.api.nvim_create_augroup("autocomp", { clear = true })
  -- vim.api.nvim_create_autocmd("VimLeave", {
  --   desc = "Stop running auto compiler",
  --   group = "autocomp",
  --   pattern = "*",
  --   command = "!autocomp %:p stop",
  -- })

  -- vim.api.nvim_create_augroup("dapui", { clear = true })
  -- vim.api.nvim_create_autocmd("FileType", {
  --   desc = "Make q close dap floating windows",
  --   group = "dapui",
  --   pattern = "dap-float",
  --   callback = function()
  --     vim.keymap.set("n", "q", "<cmd>close!<cr>")
  --   end,
  -- })
  --
  -- vim.api.nvim_create_augroup("mini", { clear = true })
  -- vim.api.nvim_create_autocmd("FileType", {
  --   desc = "Disable indent scope for conent types",
  --   group = "mini",
  --   callback = function()
  --     if
  --       vim.tbl_contains({
  --         "NvimTree",
  --         "TelescopePrompt",
  --         "Trouble",
  --         "alpha",
  --         "help",
  --         "lsp-installer",
  --         "lspinfo",
  --         "neo-tree",
  --         "neogitstatus",
  --         "packer",
  --         "startify",
  --       }, vim.bo.filetype) or vim.tbl_contains({ "nofile", "terminal" }, vim.bo.buftype)
  --     then
  --       vim.b.miniindentscope_disable = true
  --     end
  --   end,
  -- })
else
  -- Restore cursor last position upon reopening the file
  --  vim.cmd [[
  --   augroup last_cursor_position
  --     autocmd!
  --     autocmd BufReadPost *
  --       \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' | execute "normal! g`\"zvzz" | endif
  --   augroup END
  -- ]]

  -- vim.cmd(
  --   [[
  -- command! Diary 2VimwikiDiaryIndex
  -- augroup vimwikigroup
  --     autocmd!
  --     " automatically update links on read diary
  --     autocmd BufEnter,BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
  -- augroup end
  -- ]],
  --   false
  -- )
  --
  -- vim.cmd(
  --   [[
  -- command! NewDiary 2VimwikiMakeDiaryNote
  -- augroup vimwikigroup2
  --     autocmd!
  --     autocmd BufNewFile * set conceallevel=3
  -- augroup end
  -- ]],
  --   false
  -- )
  --
  -- vim.cmd(
  --   [[
  -- command! TODO e ~/vimwiki/TODO/index.wiki
  -- augroup vimwikigroup3
  --     autocmd!
  --     " automatically update links on read diary
  --     autocmd BufRead,BufNewFile index.wiki set conceallevel=3
  -- augroup end
  -- ]],
  --   false
  -- )
end
