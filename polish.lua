-- This function is run last
return {
  require "user.mappings",
  require "user.autocmds",
  require "user.theme.sacr3d-moon",

  -- Set autocommands
  vim.api.nvim_create_augroup("packer_conf", { clear = true }),
  vim.api.nvim_create_autocmd("BufWritePost", {
    desc = "Sync packer after modifying plugins.lua",
    group = "packer_conf",
    pattern = "plugins.lua",
    command = "source <afile> | PackerSync",
  }),
}