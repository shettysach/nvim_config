local M = {}

function M.setup()
  local fidget = require("fidget")

  fidget.setup({
    progress = {
      display = {
        render_limit = 10,

        progress_ttl = math.huge,
        progress_icon = { pattern = "dots", period = 1 },

        done_ttl = 2,
        done_icon = "",

        -- group_style = "WarningMsg",
        -- icon_style = "WarningMsg",

        priority = 30,
        skip_history = true,
      },
    },

    notification = {
      window = {
        winblend = 0,
        border = "none",
        zindex = 45,
        max_width = 40,
        max_height = 0,
        x_padding = 1,
        y_padding = 1,
        align = "bottom",
        relative = "editor",
        -- normal_hl = "LspInlayHint",
      },
    },
  })
end

return M
