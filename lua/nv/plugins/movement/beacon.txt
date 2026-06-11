return {
  -- "DanilaMihailov/beacon.nvim",
  "shettysach/beacon.nvim",
  config = function()
    require("beacon").setup({
      enabled = true,
      speed = 2,
      width = 30,
      winblend = 50,
      fps = 60,
      min_jump = 5,
      cursor_events = { "CursorMoved" },
      window_events = { "WinEnter", "FocusGained" },
      highlight = { bg = "white" },
    })
  end,
}
