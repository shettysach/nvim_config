vim.treesitter.start()

vim.lsp.config("hls", {
  settings = {
    haskell = {
      plugin = {
        rename = { config = { crossModule = true } },
      },
    },
  },
})
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2