return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- nix = { "alejandra" },
        nix = { "alejandra" },
        -- nu = {"nufmt"};

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
        python = { "black" },
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
  end,
}
