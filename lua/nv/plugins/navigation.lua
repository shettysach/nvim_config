vim.g.canola = { columns = { "git_status", "icon" } }
vim.g.canola_git = {
  show = { untracked = true, ignored = true },
  format = "compact",
}
vim.keymap.set("n", "-", "<CMD>Canola<CR>")

vim.g.fff = {
  lazy_sync = true,
  debug = {
    enabled = false,
    show_scores = false,
  },
  prompt = "❯ ",
  layout = { prompt_position = "top" },
}

vim.schedule(function()
  local fff = require("fff")

  vim.keymap.set("n", "<leader>ff", fff.find_files, { desc = "Find files" })
  vim.keymap.set("n", "<leader>fw", fff.live_grep, { desc = "Live grep" })
  vim.keymap.set("n", "<leader>fz", function()
    fff.live_grep({ grep = { modes = { "fuzzy", "plain" } } })
  end, { desc = "Fuzzy live grep" })
  vim.keymap.set("n", "<leader>fc", function()
    fff.live_grep({ query = vim.fn.expand("<cword>") })
  end, { desc = "Search current word" })

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

  vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "PmenuSel" })
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      vim.api.nvim_set_hl(0, "MiniPickMatchCurrent", { link = "PmenuSel" })
    end,
  })

  vim.keymap.set("n", "<leader>fs", function()
    extra.pickers.lsp({ scope = "document_symbol" })
  end, { desc = "Fuzzy find LSP symbols" })
  vim.keymap.set("n", "<leader>fm", function()
    extra.pickers.marks()
  end, { desc = "Fuzzy find marks" })
  vim.keymap.set("n", "<leader>fd", function()
    extra.pickers.diagnostic()
  end, { desc = "Fuzzy find diagnostics" })
  vim.keymap.set("n", "<leader>cc", function()
    extra.pickers.colorschemes()
  end, { desc = "Colorschemes" })

  require("marks").setup({})
end)
