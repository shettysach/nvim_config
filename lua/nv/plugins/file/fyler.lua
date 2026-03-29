return {
  "A7Lavinraj/fyler.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  branch = "main", -- Use stable branch for production
  lazy = false, -- Necessary for `default_explorer` to work properly
  vim.keymap.set("n", "-", "<CMD>Fyler<CR>"),
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
