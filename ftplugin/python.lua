vim.treesitter.start()

vim.lsp.config("ty", {})
vim.lsp.config("ruff", {})
vim.lsp.enable("ty")
vim.lsp.enable("ruff")
vim.bo.shiftwidth = 4
vim.bo.tabstop = 4