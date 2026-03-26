---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  -- event = { "BufReadPre", "BufNewFile" },
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter")

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "markdown", "markdown_inline" },
      callback = function()
        vim.treesitter.start()
      end,
    })

    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },

      auto_install = true,
      ensure_installed = {
        "rust",
        "python",
        "zig",
        "c",
        "haskell",
        "bash",
        "toml",

        "markdown",
        "markdown_inline",
        "comment",

        "lua",
        "vim",
        "gitignore",
        "vimdoc",

        "json",
        "html",
        "css",
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
