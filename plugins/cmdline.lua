local null_ok, null_ls = pcall(require, "null-ls")
local cmp_ok, cmp = pcall(require, "cmp")
if null_ok and cmp_ok then
  -- Use buffer source for `/`
  -- (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    view = {
      entries = { name = "custom" },
    },
    sources = {
      { name = "buffer" },
    },
  })

  -- Use cmdline & path source for ':'
  -- (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end
