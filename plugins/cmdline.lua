local status_ok, cmp = pcall(require, "null-ls")
if status_ok then
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
