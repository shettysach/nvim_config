local languages = {
  "lua",
  "nix",
  "rust",
  "c",
  "cpp",
  "python",
  "markdown",
  "markdown_inline",
  "comment",
  "toml",
  "zig",
  "odin",
  "haskell",
  "gitignore",
  "vim",
  "vimdoc",
  "bash",
  "json",
  "html",
  "css",
}

---@diagnostic disable: missing-fields
return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter")
    -- treesitter.install(languages)
    treesitter.setup({
      highlight = { enable = true },
      indent = { enable = true },
      autotag = { enable = true },
    })
  end,
}
