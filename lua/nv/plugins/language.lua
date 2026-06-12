require("blink.cmp").setup({
  keymap = {
    preset = "enter",
    ["<C-space>"] = { "show_and_insert", "show_documentation", "hide_documentation" },
    ["<Esc>"] = { "cancel", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },
  snippets = { preset = "default" },
  appearance = { nerd_font_variant = "mono" },
  completion = {
    keyword = { range = "full" },
    list = {
      selection = { preselect = true, auto_insert = true },
    },
    documentation = { auto_show = true },
    menu = { auto_show = true },
  },
  sources = { default = { "snippets", "lsp", "path", "buffer" } },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.api.nvim_create_autocmd("FileType", {
  once = true,
  pattern = "lua",
  callback = function()
    require("lazydev").setup({
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    })
  end,
})

vim.schedule(function()
  require("nvim-treesitter").setup({
    highlight = { enable = true },
    indent = { enable = true },
    autotag = { enable = true },
  })
end)
