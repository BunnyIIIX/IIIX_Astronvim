local group = vim.api.nvim_create_augroup("Sacr3d_Auto_Resize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", { pattern = "*", command = "tabdo wincmd =", group = group })
vim.cmd [[
  command! Sacr3dReload lua require('user.utils').reload_user_config(true)
  command! Sacr3dReloadSync lua require('user.utils').reload_user_config_sync()
  command! LspFormat lua vim.lsp.buf.formatting()
  " command! Sacr3dUpdate lua require('user.utils').update()

  " augroup Sacr3d_Auto_Resize
  "   autocmd!
  "   autocmd VimResized * tabdo wincmd =
  " augroup end
]]

vim.cmd(
  [[
command! Diary 2VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufEnter,BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end
]],
  false
)

vim.cmd(
  [[
command! NewDiary 2VimwikiMakeDiaryNote
augroup vimwikigroup2
    autocmd!
    autocmd BufNewFile * set conceallevel=3
augroup end
]],
  false
)

vim.cmd(
  [[
command! TODO e ~/vimwiki/TODO/index.wiki
augroup vimwikigroup3
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile index.wiki set conceallevel=3
augroup end
]],
  false
)

vim.cmd [[
" This won't work if you open the same help file more than once
" autocmd FileType help wincmd T

" This works
" autocmd BufEnter *.txt if &filetype == 'help' | wincmd T | endif
]]
