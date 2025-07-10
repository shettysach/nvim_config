return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({})
    require("transparent").clear_prefix("NvimTree")
  end,
}
