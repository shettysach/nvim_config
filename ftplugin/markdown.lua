vim.treesitter.start()

vim.lsp.config("marksman", {})
vim.lsp.config("harper_ls", {})
vim.lsp.enable("marksman")
vim.lsp.enable("harper_ls")
vim.wo.wrap = true

