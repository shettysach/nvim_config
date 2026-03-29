vim.treesitter.start()

vim.lsp.config("nixd", {})
vim.lsp.enable("nixd")
vim.bo.expandtab = false