return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        globalstatus = true,
        theme = "auto",

        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },

        -- section_separators = { left = "", right = "" },
        -- component_separators = { left = "│", right = "│" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            color = { gui = "bold" },
          },
        },
        lualine_x = { "encoding", "filetype" },
        lualine_z = {
          {
            "location",
            color = { gui = "bold" },
          },
        },
      },
      tabline = {
        lualine_a = {
          {
            function()
              local cwd = vim.fn.getcwd()
              local tail = vim.fn.fnamemodify(cwd, ":t")
              return tail
            end,

            color = { gui = "bold" },
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {
          { "tabs", mode = 1, max_length = vim.o.columns },
          -- {
          --     function()
          --         vim.o.showtabline = 1
          --         return ""
          --     end,
          -- },
        },
      },
    })
  end,
}
