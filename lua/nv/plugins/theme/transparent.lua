local M = {}

function M.setup()
  require("transparent").setup({})
  require("transparent").clear_prefix("NvimTree")
end

return M
