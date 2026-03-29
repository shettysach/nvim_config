vim.treesitter.start()

vim.lsp.config("ols", {
  settings = {
    enable_rename = true,
    enable_references = true,
    checker_args = "-strict-style",
  },
})
vim.lsp.enable("ols")
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4