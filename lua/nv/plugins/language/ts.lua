local languages = {
  "lua",

  "rust",
  "python",
  "c",
  "nix",
  "bash",
  "toml",

  "markdown",
  "markdown_inline",
  "comment",

  "zig",
  "odin",
  "haskell",

  "gitignore",
  "vim",
  "vimdoc",

  "json",
  "html",
  "css",
}

---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "MeanderingProgrammer/treesitter-modules.nvim",
  },
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.install(languages)
    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })

    require("treesitter-modules").setup({
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          node_decremental = "<BS>",
          scope_incremental = false,
        },
      },
    })
  end,
}
