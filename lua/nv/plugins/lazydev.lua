local M = {}

function M.setup()
  require("lazydev").setup({
    library = {
      { path = "luvit-meta/library", words = { "vim%.uv" } },
    },
  })
end

return M
