require("transparent").setup({})
vim.keymap.set("n", "<leader>ct", "<cmd>TransparentToggle<CR>", { desc = "Transparency" })

require("tokyonight").setup({ style = "night" })
vim.cmd.colorscheme("tokyonight")

require("mini.icons").setup({})

require("lualine").setup({
  options = {
    globalstatus = true,
    theme = "auto",
    -- component_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { { "mode", color = { gui = "bold" } } },
    lualine_z = { { "location", color = { gui = "bold" } } },
    lualine_b = {
      "branch",
      "diff",
      { "diagnostics", symbols = { error = "E", warn = "W", info = "I", hint = "H" } },
    },
    lualine_c = { "lsp_status" },
  },
  tabline = {
    lualine_a = {
      {
        function()
          return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":p:h:t")
        end,
        color = { gui = "bold" },
      },
    },
    lualine_b = { { "tabs", mode = 1, max_length = vim.o.columns } },
  },
})

vim.opt.wildignore:append({
  "blue.vim",
  "darkblue.vim",
  "delek.vim",
  "desert.vim",
  "elflord.vim",
  "evening.vim",
  "habamax.vim",
  "industry.vim",
  "koehler.vim",
  "lunaperche.vim",
  "morning.vim",
  "murphy.vim",
  "pablo.vim",
  "peachpuff.vim",
  "quiet.vim",
  "retrobox.vim",
  "ron.vim",
  "shine.vim",
  "slate.vim",
  "sorbet.vim",
  "torte.vim",
  "wildcharm.vim",
  "zaibatsu.vim",
  "zellner.vim",
  "unokai.vim",
  "catppuccin.vim",
})
