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

vim.keymap.set("n", "<leader>i", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- TSManager

local langs = {
  "c",
  "cpp",
  "rust",
  "odin",

  "python",
  "haskell",

  "nix",
  "toml",
  "json",
  "vimdoc",

  "bash",
  "zsh",
  "nu",
}

vim.api.nvim_create_user_command("TSManager", function()
  vim.api.nvim_del_user_command("TSManager")

  vim.cmd.packadd("tree-sitter-manager.nvim")
  require("tree-sitter-manager").setup({
    ensure_installed = langs,
    auto_install = false,
    highlight = false,
    nerdfont = false,
  })

  vim.cmd.TSManager()
end, {})
