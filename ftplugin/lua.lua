vim.treesitter.start()

vim.lsp.config("lua_ls", {
  settings = {},
})
vim.lsp.enable("lua_ls")
vim.bo.shiftwidth = 2
vim.bo.tabstop = 2