vim.g.fff = {
  lazy_sync = true,
  debug = {
    enabled = false,
    show_scores = false,
  },
  prompt = "❯ ",
  layout = { prompt_position = "top" },
}

--

local fyler = require("fyler")
fyler.setup({
  integrations = {
    icon = "mini_icons",
    winpick = function(_, onsubmit)
      onsubmit(vim.api.nvim_get_current_win())
    end,
  },
  extensions = { git = { enabled = true } },
  views = {
    finder = {
      default_explorer = true,
      close_on_select = false,
      follow_current_file = true,
      win = {
        win_opts = {
          concealcursor = "nvic",
          conceallevel = 3,
          cursorline = false,
          number = true,
          relativenumber = true,
          winhighlight = "Normal:FylerNormal,NormalNC:FylerNormalNC",
          wrap = false,
          signcolumn = "yes",
        },
      },
    },
  },
})

vim.keymap.set("n", "-", "<CMD>Fyler<CR>")

--

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

  ----

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
