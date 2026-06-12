local gh = function(repo)
  return "https://github.com/" .. repo .. ".git"
end

local hooks = {
  ["fff.nvim"] = function()
    require("fff.download").download_or_build_binary()
  end,

  ["nvim-treesitter"] = function()
    vim.cmd.TSUpdate()
  end,
}

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("NvPackHooks", { clear = true }),
  callback = function(event)
    local name = event.data.spec.name
    local kind = event.data.kind

    if kind ~= "install" and kind ~= "update" then
      return
    end

    local hook = hooks[name]
    if not hook then
      return
    end

    if not event.data.active then
      vim.cmd.packadd(name)
    end

    hook()
  end,
})

vim.pack.add({
  gh("raddari/last-color.nvim"),
  gh("folke/tokyonight.nvim"),
  gh("nvim-mini/mini.icons"),
  gh("nvim-lualine/lualine.nvim"),
  { src = gh("barrettruth/canola.nvim"), version = "canola" },
  gh("barrettruth/canola-collection"),
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1.x") },
  gh("dmtrKovalenko/fff.nvim"),
  { src = gh("nvim-mini/mini.pick"), version = vim.version.range("*") },
  gh("nvim-mini/mini.extra"),
  gh("lewis6991/gitsigns.nvim"),
  { src = gh("j-hui/fidget.nvim"), version = "v1.4.5" },
  gh("nvim-treesitter/nvim-treesitter"),
  gh("chentoast/marks.nvim"),
  gh("stevearc/conform.nvim"),
  gh("brenoprata10/nvim-highlight-colors"),
  gh("xiyaowong/transparent.nvim"),
  { src = gh("echasnovski/mini.clue"), version = vim.version.range("*") },
  { src = gh("echasnovski/mini.indentscope"), version = vim.version.range("*") },
  { src = gh("echasnovski/mini.surround"), version = vim.version.range("*") },
  gh("windwp/nvim-autopairs"),
  gh("folke/lazydev.nvim"),
  gh("Bilal2453/luvit-meta"),
})

require("nv.plugins.ui")
require("nv.plugins.navigation")
require("nv.plugins.editing")
require("nv.plugins.language")

-- Update with :packupdate, restore with :packupdate ++offline ++lockfile,
-- and remove inactive plugins with :packdel ++all.
