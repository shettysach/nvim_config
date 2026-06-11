local M = {}

function M.setup()
  require("tokyonight").setup({ style = "night" })
end

return M

-- {
--   "rebelot/kanagawa.nvim",
--   priority = 1000,
--   opts = {
--     theme = "dragon",
--     compile = true,
--
--     background = { dark = "dragon" },
--     colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
--   },
-- },

-- {
--   "thesimonho/kanagawa-paper.nvim",
--   opts = {
--     cache = false,
--   },
--   lazy = false,
--   priority = 1000,
-- },
--
