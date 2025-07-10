vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.undofile = true
opt.mouse = {}

opt.relativenumber = true
opt.number = true

opt.shiftwidth = 4
opt.tabstop=4
opt.softtabstop=4
opt.expandtab = true
opt.autoindent = true

opt.ignorecase = true
opt.smartcase = true


opt.winborder = "single"
opt.shortmess = "IF"
opt.termguicolors = true
opt.showmode = false
opt.background = "dark"
opt.fillchars = { eob = " " }
opt.signcolumn = "yes:2"

opt.backspace = "indent,eol,start"

opt.clipboard:append("unnamedplus")

opt.wrap = true
opt.breakindent = true
opt.showbreak = "󰘍 "
opt.linebreak = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.splitright = true
opt.splitbelow = true
