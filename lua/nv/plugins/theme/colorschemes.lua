return {
  --
  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   lazy = false,
  --   opts = { style = "night" },
  -- },

  -- {
  --   "thesimonho/kanagawa-paper.nvim",
  --   opts = {
  --     cache = false,
  --   },
  --   lazy = false,
  --   priority = 1000,
  -- },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      theme = "dragon",
      compile = true,

      background = { dark = "dragon" },
      colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
    },
  },
}
