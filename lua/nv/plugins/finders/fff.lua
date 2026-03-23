return {
  "dmtrKovalenko/fff.nvim",
  -- build = function()
  --   require("fff.download").download_or_build_binary()
  -- end,
  build = "nix run .#release",
  opts = { -- (optional)
    debug = {
      enabled = false, -- we expect your collaboration at least during the beta
      show_scores = false, -- to help us optimize the scoring system, feel free to share your scores!
    },

    prompt = "❯ ",
    layout = { prompt_position = "top" },
  },
  -- No need to lazy-load with lazy.nvim.
  -- This plugin initializes itself lazily.
  lazy = false,
  keys = {
    {
      "<leader>ff", -- try it if you didn't it is a banger keybinding for a picker
      function()
        require("fff").find_files()
      end,
      desc = "FFFind files",
    },
    {
      "<leader>fw",
      function()
        require("fff").live_grep()
      end,
      desc = "LiFFFe grep",
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
      desc = "Live fffuzy grep",
    },
    {
      "<leader>fc",
      function()
        require("fff").live_grep({ query = vim.fn.expand("<cword>") })
      end,
      desc = "Search current word",
    },
  },
}
