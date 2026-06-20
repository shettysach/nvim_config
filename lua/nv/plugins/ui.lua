require("transparent").setup({})

require("tokyonight").setup({ style = "night" })
vim.cmd.colorscheme("tokyonight")

vim.cmd(
  [[set wildignore+=blue.vim,darkblue.vim,delek.vim,desert.vim,elflord.vim,evening.vim,habamax.vim,industry.vim,koehler.vim,lunaperche.vim,morning.vim,murphy.vim,pablo.vim,peachpuff.vim,quiet.vim,retrobox.vim,ron.vim,shine.vim,slate.vim,sorbet.vim,torte.vim,wildcharm.vim,zaibatsu.vim,zellner.vim,unokai.vim,vim.vim]]
)

require("mini.icons").setup({})

vim.schedule(function()
  require("lualine").setup({
    options = {
      globalstatus = true,
      theme = "auto",
    },
    sections = {
      lualine_a = { { "mode", color = { gui = "bold" } } },
      lualine_z = { { "location", color = { gui = "bold" } } },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          symbols = {
            error = "E",
            warn = "W",
            info = "I",
            hint = "H",
          },
        },
      },
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
      lualine_b = {
        {
          "tabs",
          mode = 1,
          max_length = vim.o.columns,
        },
      },
    },
  })

  require("fidget").setup({
    progress = {
      display = {
        render_limit = 10,
        progress_ttl = math.huge,
        progress_icon = { pattern = "dots", period = 1 },
        done_ttl = 2,
        done_icon = "",
        priority = 30,
        skip_history = true,
      },
    },
    notification = {
      window = {
        winblend = 0,
        border = "none",
        zindex = 45,
        max_width = 40,
        max_height = 0,
        x_padding = 1,
        y_padding = 1,
        align = "bottom",
        relative = "editor",
      },
    },
  })
end)
