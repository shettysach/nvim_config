local autocmd = vim.api.nvim_create_autocmd

autocmd({ "ColorScheme" }, {
  callback = function()
    vim.cmd([[highlight! link LspInlayHint DiagnosticHint]])
    vim.cmd([[highlight! link Beacon TodoBgTODO]])
    vim.cmd([[highlight! link LineNr Type]])
    vim.cmd([[highlight! link FylerFSDirectoryIcon Directory]])
  end,
})

autocmd({ "TermOpen" }, {
  callback = function()
    vim.cmd([[startinsert]])
  end,
})

autocmd({ "TextYankPost" }, {
  callback = function()
    vim.hl.on_yank({ higroup = "Visual" })
  end,
})

autocmd("FileType", {
  pattern = "cuda",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})
