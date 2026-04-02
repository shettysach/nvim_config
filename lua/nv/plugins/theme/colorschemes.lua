return {
  { "raddari/last-color.nvim" },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = { style = "night" },
  },

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
}
