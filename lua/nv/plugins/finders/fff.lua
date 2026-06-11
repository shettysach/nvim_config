local M = {}

function M.setup()
  local fff = require("fff")
  fff.setup({
    debug = {
      enabled = false,
      show_scores = false,
    },
    prompt = "❯ ",
    layout = { prompt_position = "top" },
  })

  vim.keymap.set("n", "<leader>ff", fff.find_files, { desc = "Find files" })
  vim.keymap.set("n", "<leader>fw", fff.live_grep, { desc = "Live grep" })
  vim.keymap.set("n", "<leader>fz", function()
    fff.live_grep({ grep = { modes = { "fuzzy", "plain" } } })
  end, { desc = "Fuzzy live grep" })
  vim.keymap.set("n", "<leader>fc", function()
    fff.live_grep({ query = vim.fn.expand("<cword>") })
  end, { desc = "Search current word" })
end

return M
