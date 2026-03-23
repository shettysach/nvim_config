vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local lsp = vim.lsp
local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- WINDOW
-- keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>")
-- keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>")
-- keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>")
-- keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>")
-- keymap.set('n', '<C-i>', '<C-i>', { noremap = true })
--
-- TABS
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<Tab>", "<cmd>tabnext<CR>", { desc = "Next tab" })
keymap.set("n", "<S-Tab>", "<cmd>tabprevious<CR>", { desc = "Next tab" })

keymap.set("n", "<C-i>", "<C-i>", { desc = "Jump forward" })
keymap.set("n", "<leader>p", function()
  print(vim.fn.expand("%:p"))
end, { desc = "Print current buffer full path" })

-- INLAY HINTS
keymap.set("n", "<leader>i", function()
  lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({}))
end, { desc = "Toggle inlay hints" })

-- TRANSPARENCY
keymap.set("n", "<leader>ct", "<cmd>TransparentToggle<CR>", { desc = "Transparency" })

-- TERMINAL
keymap.set("n", "<leader>v", "<cmd>vsplit<cr><cmd>terminal<cr>", { desc = "Vsplit terminal" })
keymap.set("n", "<leader>s", "<cmd>split<cr><cmd>terminal<cr>", { desc = "Hsplit terminal" })
keymap.set("n", "<leader>tt", "<cmd>tabnew<cr><cmd>terminal<cr>", { desc = "Tabnew terminal" })
keymap.set("t", "<C-w>", [[<C-\><C-n>]])

-- LSP DIAGNOSTICS

vim.diagnostic.config({
  virtual_text = true,
  virtual_lines = false,
})

-- local toggle = true
-- function ToggleDiagnosticsStyle()
--     vim.diagnostic.config({
--         virtual_text = toggle,
--         virtual_lines = not toggle,
--     })
--
--     toggle = not toggle
-- end
--
-- ToggleDiagnosticsStyle()
--
-- keymap.set(
--     'n',
--     '<leader>cd',
--     ToggleDiagnosticsStyle,
--     {  desc = "Toggle diagnostics style" }
-- )
