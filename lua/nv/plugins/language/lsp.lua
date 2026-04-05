return {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    "saghen/blink.cmp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", function()
          vim.lsp.buf.references(nil, { picker = true })
        end, opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", function()
          vim.lsp.buf.declaration(nil, { picker = true })
        end, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", function()
          vim.lsp.buf.definition(nil, { picker = true })
        end, opts)

        opts.desc = "Show LSP references"
        keymap.set("n", "gr", function()
          vim.lsp.buf.references(nil, { picker = true })
        end, opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", function()
          vim.lsp.buf.implementation(nil, { picker = true })
        end, opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", function()
          vim.lsp.buf.type_definition(nil, { picker = true })
        end, opts)
        --
        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", function()
          vim.lsp.buf.workspace_diagnostics({ picker = true })
        end, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.enable({
      "clangd",
      "harper_ls",
      "hls",
      "lua_ls",
      "marksman",
      "nixd",
      "ols",
      "ruff",
      "rust_analyzer",
      "ty",
      "zls",
    })
  end,
}
