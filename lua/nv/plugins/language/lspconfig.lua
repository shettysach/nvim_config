return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>FzfLua lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities() --
    local lspconfig = require("lspconfig")
    -- local signs = { Error = "", Warn = "", Hint = "󰌶", Info = "" }
    -- for type, icon in pairs(signs) do
    --     local hl = "DiagnosticSign" .. type
    --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    -- end

    local handlers = {
      "textDocument/hover",
      "textDocument/signatureHelp",
    }

    lspconfig.rust_analyzer.setup({
      filetypes = { "rust" },
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        ["rust-analyzer"] = {

          cargo = { -- features = "all",
            buildScripts = { enable = false },
          },
          procMacro = { enable = false },
          diagnostics = { disabled = { "unresolved-proc-macro" } },

          cachePriming = { enable = false },

          checkOnSave = false,
          check = { command = "clippy" },
        },
      },
    })

    lspconfig.clangd.setup({
      filetypes = { "c", "cpp", "cuda", "proto", "hpp" },
      capabilities = capabilities,
      handlers = handlers,
      settings = {},
    })

    lspconfig.hls.setup({
      filetypes = { "haskell", "lhaskell", "cabal" },
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        haskell = {
          plugin = {
            rename = {
              config = {
                crossModule = true,
              },
            },
          },
        },
      },
    })

    lspconfig.ols.setup({
      filetype = { "odin" },
      settings = {
        enable_rename = true,
        enable_references = true,
      },
    })

    lspconfig.zls.setup({
      filetype = { "zig" },
      capabilities = capabilities,
      handlers = handlers,
      settings = {},
    })

    -- lspconfig.nil_ls.setup({
    lspconfig.nixd.setup({
      filetype = { "nix" },
      capabilities = capabilities,
      handlers = handlers,
      settings = {
        -- ['nil'] = {
        --     testSetting = 42,
        -- },
      },
    })

    lspconfig.lua_ls.setup({
      filetype = { "lua" },
      capabilities = capabilities,
      handlers = handlers,
      settings = {},
    })

    -- PYTHON
    -- require('lspconfig').basedpyright.setup {
    --   filetype = { "python" },
    --   capabilities = capabilities,
    --   handlers = handlers,
    --   settings = {
    --     pyright = {
    --       disableOrganizeImports = true,
    --     },
    --     basedpyright = {
    --       typeCheckingMode = "standard",
    --     },
    --     python = {
    --       analysis = {
    --         ignore = { '*' },
    --       },
    --     },
    --   },
    -- }

    require("lspconfig").ruff.setup({
      filetype = { "python" },
      capabilities = capabilities,
      handlers = handlers,
      settings = {},
    })

    -- vim.api.nvim_create_autocmd("LspAttach", {
    --   group = vim.api.nvim_create_augroup('lsp_attach_disable_ruff_hover', { clear = true }),
    --   callback = function(args)
    --     local client = vim.lsp.get_client_by_id(args.data.client_id)
    --     if client == nil then
    --       return
    --     end
    --     if client.name == 'ruff' then
    --       -- Disable hover in favor of Pyright
    --       client.server_capabilities.hoverProvider = false
    --     end
    --   end,
    --   desc = 'LSP: Disable hover capability from Ruff',
    -- })
  end,
}
