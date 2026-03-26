return {
  -- Keep nvim-lspconfig to get its server defaults (it now ships configs in lsp/)
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "saghen/blink.cmp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- Keymaps on LspAttach (works the same)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local keymap = vim.keymap

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts)

        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>FzfLua lsp_references<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>FzfLua lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- Capabilities: define once for all servers via the global "*" config
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Optional: if you had custom handler overrides, define them here.
    -- Your original code had a list of method names, which doesn't override anything.
    -- Example (disabled):
    -- local custom_handlers = {
    --   ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    --   ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    -- }

    -- Global defaults for all LSPs
    vim.lsp.config("*", {
      capabilities = capabilities,
      -- handlers = custom_handlers, -- uncomment if you actually provide functions
    })

    -- Per-server config (mirrors what you had in lspconfig.<server>.setup)
    vim.lsp.config("rust_analyzer", {
      filetypes = { "rust" },
      settings = {
        ["rust-analyzer"] = {
          -- cargo = { buildScripts = { enable = false } },
          -- procMacro = { enable = false },
          -- diagnostics = { disabled = { "unresolved-proc-macro" } },
          -- cachePriming = { enable = false },
          -- checkOnSave = false,
          check = { command = "clippy" },
        },
      },
    })

    vim.lsp.config("clangd", {
      filetypes = { "c", "cpp", "cuda", "hpp" },
      settings = {},
    })
    vim.lsp.enable("clangd")

    --

    vim.lsp.config("hls", {
      filetypes = { "haskell", "lhaskell", "cabal" },
      settings = {
        haskell = {
          plugin = {
            rename = { config = { crossModule = true } },
          },
        },
      },
    })

    -- Odin (ols). If not provided by lspconfig in your version, this local config is sufficient.
    vim.lsp.config("ols", {
      filetypes = { "odin" },
      settings = {
        enable_rename = true,
        enable_references = true,
        checker_args = "-strict-style",
      },
    })

    vim.lsp.config("zls", {
      filetypes = { "zig" },
      settings = {},
    })

    -- Nix
    vim.lsp.config("nixd", { filetypes = { "nix" } })
    vim.lsp.enable("nixd")

    vim.lsp.config("lua_ls", {
      filetypes = { "lua" },
      settings = {},
    })

    -- Python
    -- Use Neovim's built-in vim.lsp.config API to configure Pyright
    -- This points Pyright at your project's .venv so it can resolve torch/cutlass.

    vim.lsp.config("ty", { filetypes = { "python" } })
    vim.lsp.config("ruff", { filetypes = { "python" } })

    vim.lsp.enable("ty")
    vim.lsp.enable("ruff")

    --

    vim.lsp.config("marksman", { filetypes = { "markdown" } })
    vim.lsp.config("harper_ls", { filetypes = { "markdown" } })

    vim.lsp.enable("marksman")
    vim.lsp.enable("harper_ls")

    --

    vim.lsp.enable({ "rust_analyzer", "hls", "ols", "zls", "lua_ls" })
  end,
}
