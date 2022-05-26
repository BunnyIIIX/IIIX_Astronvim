return {
  clangd = {
    capabilities = {
      offsetEncoding = "utf-8",
    },
  },
  texlab = {
    settings = {
      texlab = {
        build = {
          onSave = true,
        },
        forwardSearch = {
          executable = "zathura",
          args = { "--synctex-forward", "%l:1:%f", "%p" },
        },
      },
    },
  },
}
