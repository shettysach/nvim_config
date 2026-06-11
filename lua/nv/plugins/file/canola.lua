return {
  {
    "barrettruth/canola.nvim",
    branch = "canola",
    lazy = false,
    init = function()
      -- Must be in init so config.init() reads it during plugin load
      vim.g.canola = { columns = { "git_status", "icon" } }
      vim.g.canola_git = {
        show = { untracked = true, ignored = true },
        format = "compact", -- 'compact' | 'symbol' | 'porcelain'
      }
    end,
    dependencies = {
      { "nvim-mini/mini.icons", opts = {} },
    },
    config = function()
      vim.keymap.set("n", "-", "<CMD>Canola<CR>")
    end,
  },

  {
    "barrettruth/canola-collection",
    lazy = false,
    dependencies = { "barrettruth/canola.nvim" },
    config = function() end,
  },
}
