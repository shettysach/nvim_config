return {
  "nvim-mini/mini.pick",
  version = "*",
  event = "VeryLazy",
  dependencies = {
    "nvim-mini/mini.extra",
    "nvim-mini/mini.icons",
  },
  config = function()
    local minipick = require("mini.pick")
    local extra = require("mini.extra")

    minipick.setup({
      window = {
        config = function()
          local height = math.floor(0.618 * vim.o.lines)
          local width = math.floor(0.618 * vim.o.columns)
          return {
            anchor = "NW",
            height = height,
            width = width,
            row = math.floor(0.5 * (vim.o.lines - height)),
            col = math.floor(0.5 * (vim.o.columns - width)),
          }
        end,
      },
    })

    local keymap = vim.keymap
    keymap.set("n", "<leader>fs", function()
      extra.pickers.lsp({ scope = "document_symbol" })
    end, { desc = "Fuzzy find LSP symbols" })

    keymap.set("n", "<leader>fm", function()
      extra.pickers.marks()
    end, { desc = "Fuzzy find marks" })

    keymap.set("n", "<leader>fd", function()
      extra.pickers.diagnostic()
    end, { desc = "Fuzzy find diagnostics" })

    keymap.set("n", "<leader>cc", function()
      extra.pickers.colorschemes()
    end, { desc = "Colorschemes" })
  end,
}
