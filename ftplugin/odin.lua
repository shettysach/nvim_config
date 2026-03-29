vim.treesitter.start()

vim.lsp.config("ols", {
  settings = {
    enable_rename = true,
    enable_references = true,
    checker_args = "-strict-style",
  },
})
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4