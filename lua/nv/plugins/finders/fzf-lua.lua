return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  config = function()
    require("fzf-lua").setup({
      winopts = {
        border = "single",
      },

      fzf_colors = {
        ["fg+"] = { "fg", { "LspInlayHint" }, "bold" },
      },

      files = {
        cwd_prompt = false,
        git_icons = false,
      },

      keymap = {
        true,
        builtin = {
          true,
        },
        fzf = {
          true,
          ["ctrl-a"] = "toggle-all",
        },
      },

      actions = {
        true,
        files = {
          true,
          ["ctrl-q"] = require("fzf-lua").actions.file_sel_to_qf,
        },
      },
    })

    local keymap = vim.keymap
    -- keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "Fuzzy find files in cwd" })
    -- keymap.set("n", "<leader>fw", "<cmd>FzfLua grep_project<cr>", { desc = "Fuzzy find word" })
    -- keymap.set("n", "<leader>fc", "<cmd>FzfLua grep_cWORD <cr>", { desc = "Fuzzy find word under cursor" })
    -- keymap.set("n", "<leader>fz", "<cmd>FzfLua grep_curbuf<cr>", { desc = "Fuzzy find in current buffer" })
    keymap.set("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "Fuzzy find LSP symbols" })
    keymap.set("n", "<leader>fm", "<cmd>FzfLua marks<cr>", { desc = "Fuzzy find marks" })
    keymap.set("n", "<leader>fd", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "Fzf Diagnostics" })
    keymap.set("n", "<leader>cc", "<cmd>FzfLua colorschemes<cr>", { desc = "Colorschemes" })
  end,
}
