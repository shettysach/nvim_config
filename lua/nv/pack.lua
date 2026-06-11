local gh = function(repo)
  return "https://github.com/" .. repo .. ".git"
end

local function notify_error(message)
  vim.schedule(function()
    vim.notify(message, vim.log.levels.ERROR)
  end)
end

local function run(command, cwd, name)
  local result = vim.system(command, { cwd = cwd }):wait()
  if result.code ~= 0 then
    notify_error(string.format("%s hook failed:\n%s", name, result.stderr or "unknown error"))
  end
end

vim.api.nvim_create_autocmd("PackChanged", {
  group = vim.api.nvim_create_augroup("NvPackHooks", { clear = true }),
  callback = function(event)
    local name = event.data.spec.name
    local kind = event.data.kind
    if kind ~= "install" and kind ~= "update" then
      return
    end

    if name == "fff.nvim" then
      if not event.data.active then
        vim.cmd.packadd(name)
      end
      local ok, err = pcall(function()
        require("fff.download").download_or_build_binary()
      end)
      if not ok then
        notify_error("fff.nvim hook failed:\n" .. err)
      end
    elseif name == "LuaSnip" then
      run({ "make", "install_jsregexp" }, event.data.path, name)
    elseif name == "nvim-treesitter" then
      if not event.data.active then
        vim.cmd.packadd(name)
      end
      local ok, err = pcall(vim.cmd.TSUpdate)
      if not ok then
        notify_error("nvim-treesitter hook failed:\n" .. err)
      end
    end
  end,
})

vim.pack.add({
  gh("nvim-lua/plenary.nvim"),
  gh("raddari/last-color.nvim"),
  gh("folke/tokyonight.nvim"),
  gh("nvim-mini/mini.icons"),
  gh("nvim-lualine/lualine.nvim"),
  { src = gh("barrettruth/canola.nvim"), version = "canola" },
  gh("barrettruth/canola-collection"),
  { src = gh("saghen/blink.cmp"), version = vim.version.range("1.x") },
  { src = gh("L3MON4D3/LuaSnip"), version = vim.version.range("2.x") },
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
}, { load = function() end })

local function load(names, module)
  for _, name in ipairs(names) do
    vim.cmd.packadd(name)
  end
  if module then
    require(module).setup()
  end
end

load({ "last-color.nvim", "tokyonight.nvim" }, "nv.plugins.theme.colorschemes")
load({ "transparent.nvim" }, "nv.plugins.theme.transparent")
load({ "mini.icons" }, "nv.plugins.misc.icons")
load({ "lualine.nvim" }, "nv.plugins.status.lualine")
vim.g.canola = { columns = { "git_status", "icon" } }
vim.g.canola_git = {
  show = { untracked = true, ignored = true },
  format = "compact",
}
load({ "canola.nvim", "canola-collection" }, "nv.plugins.file.canola")
load({ "LuaSnip", "blink.cmp" }, "nv.plugins.language.blink-cmp")

vim.api.nvim_create_autocmd("InsertEnter", {
  once = true,
  callback = function()
    load({ "nvim-autopairs" }, "nv.plugins.misc.autopairs")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  once = true,
  pattern = "lua",
  callback = function()
    load({ "luvit-meta", "lazydev.nvim" }, "nv.plugins.lazydev")
  end,
})

vim.schedule(function()
  load({ "plenary.nvim" })
  load({ "fff.nvim" }, "nv.plugins.finders.fff")
  load({ "mini.icons", "mini.extra", "mini.pick" }, "nv.plugins.finders.minipick")
  load({ "gitsigns.nvim" }, "nv.plugins.misc.gitsigns")
  load({ "fidget.nvim" }, "nv.plugins.status.fidget")
  load({ "nvim-treesitter" }, "nv.plugins.language.ts")
  load({ "marks.nvim" }, "nv.plugins.movement.marks")
  load({ "conform.nvim" }, "nv.plugins.language.conform")
  load({ "nvim-highlight-colors" }, "nv.plugins.misc.colors")
  load({ "mini.clue", "mini.indentscope", "mini.surround" }, "nv.plugins.misc.mini")
end)

-- Update with :packupdate, restore with :packupdate ++offline ++lockfile,
-- and remove inactive plugins with :packdel ++all.
require("nv.theming")
