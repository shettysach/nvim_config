-- Core function to wrap visual selection in markdown code block
local function visual_md_yank(include_path)
  local ft = vim.bo.filetype or "text"
  local path = vim.fn.expand("%:p")

  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")

  local start_line = math.min(start_pos[2], end_pos[2])
  local end_line = math.max(start_pos[2], end_pos[2])
  local start_col = math.min(start_pos[3], end_pos[3])
  local end_col = math.max(start_pos[3], end_pos[3])

  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

  if #lines > 0 then
    if #lines == 1 then
      lines[1] = string.sub(lines[1], start_col, end_col)
    else
      lines[1] = string.sub(lines[1], start_col)
      lines[#lines] = string.sub(lines[#lines], 1, end_col)
    end
  end

  local result = {}
  if include_path and path ~= "" then
    table.insert(result, path)
  end
  table.insert(result, "```" .. ft)
  vim.list_extend(result, lines)
  table.insert(result, "```")

  vim.fn.setreg("+", table.concat(result, "\n"))
  print("Copied as markdown block" .. (include_path and " with path" or ""))
  vim.api.nvim_input("<Esc>")
end

-- Keybindings
vim.keymap.set("v", "<leader>y", function()
  visual_md_yank(false)
end, { desc = "Copy Markdown block (no path)", noremap = true, silent = true })

vim.keymap.set("v", "<leader>Y", function()
  visual_md_yank(true)
end, { desc = "Copy Markdown block (with path)", noremap = true, silent = true })

--

local function normal_md_yank(n, include_path)
  local ft = vim.bo.filetype or "text"
  local path = vim.fn.expand("%:p")

  local cur_line = vim.fn.line(".")
  local lines = vim.api.nvim_buf_get_lines(0, cur_line - 1, cur_line + n, false)

  local result = {}
  if include_path and path ~= "" then
    table.insert(result, path)
  end
  table.insert(result, "```" .. ft)
  vim.list_extend(result, lines)
  table.insert(result, "```")

  vim.fn.setreg("+", table.concat(result, "\n"))
  print("Copied " .. n .. " lines as markdown block" .. (include_path and " with path" or ""))

  local ns_id = vim.api.nvim_create_namespace("custom_yank_highlight")
  vim.api.nvim_buf_add_highlight(0, ns_id, "Visual", cur_line - 1, 0, -1)
  for i = 0, n - 1 do
    vim.api.nvim_buf_add_highlight(0, ns_id, "Visual", cur_line + i, 0, -1)
  end

  -- Clear the highlight after a short delay
  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns_id, cur_line - 1, cur_line + n)
  end, 100) -- duration in milliseconds
end


vim.keymap.set("n", "<leader>yj", function()
  local count = vim.v.count ~= 0 and vim.v.count or 1
  normal_md_yank(count, false)
end, { desc = "Yank N lines as markdown (no path)", noremap = true, silent = true })

vim.keymap.set("n", "<leader>Yj", function()
  local count = vim.v.count ~= 0 and vim.v.count or 1
  normal_md_yank(count, true)
end, { desc = "Yank N lines as markdown (with path)", noremap = true, silent = true })
