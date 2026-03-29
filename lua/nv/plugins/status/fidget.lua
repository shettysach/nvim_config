return {
  "j-hui/fidget.nvim",
  tag = "v1.4.5",
  event = "VeryLazy",

  config = function()
    local fidget = require("fidget")

    fidget.setup({
      progress = {
        display = {
          render_limit = 10,
          done_ttl = 2,
          done_icon = "",
          done_style = "Constant",
          progress_ttl = math.huge,
          progress_icon = { pattern = "dots", period = 1 },
          progress_style = "LspInlayHint",
          group_style = "Title",
          icon_style = "Question",
          priority = 30,
          skip_history = true,
        },
      },

      notification = {
        window = {
          normal_hl = "LspInlayHint",
          winblend = 0,
          border = "none",
          zindex = 45,
          max_width = 40,
          max_height = 0,
          x_padding = 1,
          y_padding = 1,
          align = "bottom",
          relative = "editor",
        },
      },

      integration = {
        ["nvim-tree"] = {
          enable = true,
        },
      },
    })
  end,
}
