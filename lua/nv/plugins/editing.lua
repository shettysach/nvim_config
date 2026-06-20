vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    require("nvim-autopairs").setup({})
  end,
})

vim.schedule(function()
  require("nvim-highlight-colors").setup({})

  local conform = require("conform")
  conform.setup({
    formatters_by_ft = {
      nix = { "alejandra" },
      nu = { "nufmt" },
      cpp = { "clang-format" },
      haskell = { "fourmolu", "stylish-haskell" },
      css = { "prettierd" },
      html = { "prettierd" },
      xml = { "xmlformat" },
      javascript = { "prettierd" },
      typescript = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      yaml = { "prettierd" },
      markdown = { "prettierd" },
      lua = { "stylua" },
      -- python = { "black" },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    },
  })

  vim.keymap.set({ "n", "v" }, "<leader>cf", function()
    conform.format({
      lsp_fallback = true,
      async = false,
      timeout_ms = 1000,
    })
  end, { desc = "Format file or range" })

  require("gitsigns").setup({
    sign_priority = 100,
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local function map(mode, lhs, rhs, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, lhs, rhs, opts)
      end

      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, { desc = "Next hunk" })
      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, { desc = "Previous hunk" })
      map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
      map("v", "<leader>hs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Stage hunk (visual)" })
      map("v", "<leader>hr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, { desc = "Reset hunk (visual)" })
      map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "Reset buffer" })
      map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
      map("n", "<leader>hb", function()
        gitsigns.blame_line({ full = true })
      end, { desc = "Blame line" })
      map("n", "<leader>hd", gitsigns.diffthis, { desc = "Diff this" })
      map("n", "<leader>hD", function()
        gitsigns.diffthis("~")
      end, { desc = "Diff this (~)" })
      map("n", "<leader>hQ", function()
        gitsigns.setqflist("all")
      end, { desc = "Set quickfix list (all)" })
      map("n", "<leader>hq", gitsigns.setqflist, { desc = "Set quickfix list" })
      map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
      map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
      map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Select hunk" })
    end,
  })

  local miniclue = require("mini.clue")
  miniclue.setup({
    window = { delay = 0, config = { width = 35 } },
    triggers = {
      { mode = "n", keys = "<Leader>" },
      { mode = "x", keys = "<Leader>" },
      { mode = "i", keys = "<C-x>" },
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },
      { mode = "n", keys = '"' },
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },
      { mode = "n", keys = "<C-w>" },
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

  require("mini.indentscope").setup({
    draw = { delay = 0 },
    options = {
      border = "both",
      indent_at_cursor = true,
      try_as_border = false,
    },
    symbol = "│",
  })
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "lazy" },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
  require("mini.surround").setup({})
end)
