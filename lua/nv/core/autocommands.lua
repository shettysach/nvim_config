local autocmd = vim.api.nvim_create_autocmd

autocmd({ "ColorScheme" }, {
  callback = function()
    vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "PmenuSel" })
    vim.api.nvim_set_hl(0, "LspInlayHint", { link = "DiagnosticHint" })
  end,
})

autocmd({ "TermOpen" }, {
  callback = function()
    vim.cmd([[startinsert]])
  end,
})

autocmd({ "TextYankPost" }, {
  callback = function()
    vim.hl.hl_op({ higroup = "Visual" })
  end,
})
