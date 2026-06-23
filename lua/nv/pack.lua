local gh = function(repo)
  return "https://github.com/" .. repo .. ".git"
end

vim.pack.add({
  gh("folke/tokyonight.nvim"),
  gh("nvim-mini/mini.icons"),
  gh("nvim-lualine/lualine.nvim"),

  -- { src = gh("A7Lavinraj/fyler.nvim"), version = "e87911e6c21d099225063f5aa672e00f6dbb5976" },
  { src = gh("A7Lavinraj/fyler.nvim") },

  gh("dmtrKovalenko/fff.nvim"),
  { src = gh("nvim-mini/mini.pick"), version = vim.version.range("*") },
  gh("nvim-mini/mini.extra"),

  { src = gh("saghen/blink.cmp"), version = vim.version.range("1.x") },
  gh("lewis6991/gitsigns.nvim"),
  gh("j-hui/fidget.nvim"),
  gh("chentoast/marks.nvim"),
  gh("stevearc/conform.nvim"),
  gh("brenoprata10/nvim-highlight-colors"),
  gh("xiyaowong/transparent.nvim"),
  { src = gh("echasnovski/mini.clue"), version = vim.version.range("*") },
  { src = gh("echasnovski/mini.indentscope"), version = vim.version.range("*") },
  { src = gh("echasnovski/mini.surround"), version = vim.version.range("*") },
  gh("windwp/nvim-autopairs"),
  gh("folke/lazydev.nvim"),
})

vim.pack.add({ gh("romus204/tree-sitter-manager.nvim") }, {
  load = function() end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "fff.nvim" and (kind == "install" or kind == "update") then
      if not ev.data.active then
        vim.cmd.packadd("fff.nvim")
      end
      require("fff.download").download_or_build_binary()
    end
  end,
})

require("nv.plugins.ui")
require("nv.plugins.navigation")
require("nv.plugins.editing")
require("nv.plugins.language")

-- Update with :packupdate, restore with :packupdate ++offline ++lockfile,
-- and remove inactive plugins with :packdel ++all.
