vim.treesitter.start()

vim.lsp.config("clangd", {
  settings = {},
})
vim.lsp.enable("clangd")
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4