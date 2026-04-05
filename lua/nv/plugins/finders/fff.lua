return {
  "dmtrKovalenko/fff.nvim",
  build = "nix run .#release",
  keys = {
    {
      "<leader>ff",
      function()
        require("fff").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fw",
      function()
        require("fff").live_grep()
      end,
      desc = "Live grep",
    },
    {
      "<leader>fz",
      function()
        require("fff").live_grep({
          grep = {
            modes = { "fuzzy", "plain" },
          },
        })
      end,
      desc = "Fuzzy live grep",
    },
    {
      "<leader>fc",
      function()
        require("fff").live_grep({ query = vim.fn.expand("<cword>") })
      end,
      desc = "Search current word",
    },
  },
  opts = {
    debug = {
      enabled = false,
      show_scores = false,
    },
    prompt = "❯ ",
    layout = { prompt_position = "top" },
  },
}
