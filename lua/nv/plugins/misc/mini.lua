return {
  {
    "echasnovski/mini.clue",
    version = "*",
    config = function()
      local miniclue = require("mini.clue")

      miniclue.setup({
        window = { delay = 0, config = { width = 35 } },

        triggers = {
          -- Leader triggers
          { mode = "n", keys = "<Leader>" },
          { mode = "x", keys = "<Leader>" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },

          -- Marks
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },

          -- Registers
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },

        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers({ show_contents = true }),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
      })
    end,
  },

  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mini.indentscope").setup({
        draw = {
          delay = 0,
        },

        mappings = {
          object_scope = "ii",
          object_scope_with_border = "ai",

          goto_top = "[i",
          goto_bottom = "]i",
        },

        options = {
          border = "both",
          indent_at_cursor = true,
          try_as_border = false,
        },

        symbol = "│",
      })
    end,

    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "fzf", "help", "lazy" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  { "echasnovski/mini.surround", version = "*", opts = {} },
  -- { "tpope/vim-surround" },
}
