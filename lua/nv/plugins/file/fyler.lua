return {
  "A7Lavinraj/fyler.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  branch = "main",
  keys = {
    { "-", "<CMD>Fyler<CR>", desc = "Open file explorer" },
  },
  lazy = false,
  opts = {
    views = {
      finder = {
        default_explorer = true,
        win = {
          win_opts = {
            concealcursor = "nvic",
            conceallevel = 3,
            cursorline = false,
            number = true,
            relativenumber = true,
            winhighlight = "Normal:FylerNormal,NormalNC:FylerNormalNC",
            wrap = false,
            signcolumn = "yes",
          },
        },
      },
    },
  },
}
