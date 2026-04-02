return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        globalstatus = true,
        theme = "auto",

        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "", right = "" },

        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "│", right = "│" },
      },
      sections = {
        lualine_a = { { "mode", color = { gui = "bold" } } },
        lualine_z = { { "location", color = { gui = "bold" } } },
        lualine_b = {
          "branch",
          "diff",
          { "diagnostics", symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
        },
      },
      tabline = {
        lualine_a = {
          {
            -- function()
            -- end,

            function()
              local file = vim.api.nvim_buf_get_name(0)
              return vim.fn.fnamemodify(file, ":p:h:t")
              --   return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            end,
            color = { gui = "bold" },
            -- padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          { "tabs", mode = 1, max_length = vim.o.columns },
          -- {
          --   function()
          --     vim.o.showtabline = 1
          --     return ""
          --   end,
          -- },
        },
      },
    })
  end,
}
