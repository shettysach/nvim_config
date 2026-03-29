return {
  { "raddari/last-color.nvim" },

  -- {
  --   "folke/tokyonight.nvim",
  --   priority = 1000,
  --   opts = { style = "night" },
  -- },

  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    opts = {
      theme = "dragon",
      background = { dark = "dragon" },
      compile = true,

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
    },
  },

  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     custom_highlights = function(colors)
  --       return {
  --         ["@module"] = { fg = colors.lavender },
  --         ["@property"] = { fg = colors.blue },
  --         Type = { fg = colors.lavender },
  --       }
  --     end,
  --   },
  -- },
  -- { "cocopon/iceberg.vim", priority = 1000 },

  -- {
  --   "zenbones-theme/zenbones.nvim",
  --   dependencies = "rktjmp/lush.nvim",
  --   lazy = false,
  --   priority = 1000,
  -- },
}
