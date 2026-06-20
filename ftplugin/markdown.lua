vim.treesitter.start()

vim.lsp.enable({ "harper_ls", "marksman" })

vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.breakindent = true

vim.opt_local.foldmethod = "expr"
vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt_local.foldlevel = 6
