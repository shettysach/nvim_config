vim.g.mapleader = " "
vim.g.maplocalleader = "  "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

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
-- TRANSPARENCY
keymap.set("n", "<leader>ct", "<cmd>TransparentToggle<CR>", { desc = "Transparency" })

-- TERMINAL
keymap.set("n", "<leader>v", "<cmd>vsplit<cr><cmd>terminal<cr>", { desc = "Vsplit terminal" })
keymap.set("n", "<leader>s", "<cmd>split<cr><cmd>terminal<cr>", { desc = "Hsplit terminal" })
keymap.set("n", "<leader>tt", "<cmd>tabnew<cr><cmd>terminal<cr>", { desc = "Tabnew terminal" })
keymap.set("t", "<C-w>", [[<C-\><C-n>]])
