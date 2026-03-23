-- Yank visually selected text as a fenced Markdown code block.
-- Supports:
--  - include_path: optionally prefix block with full file path
--  - proper handling of linewise vs characterwise visual mode

local function visual_md_yank(include_path)
  local ft = vim.bo.filetype or "text"
  local path = vim.fn.expand("%:p")

  -- Determine visual mode (v = charwise, V = linewise, ^V = blockwise)
  local vmode = vim.fn.mode()

  -- Positions: [bufnum, lnum, col, off]
  local start_pos = vim.fn.getpos("v")
  local end_pos = vim.fn.getpos(".")

  local sline = start_pos[2]
  local scol = start_pos[3]
  local eline = end_pos[2]
  local ecol = end_pos[3]

  -- Normalize so (sline, scol) <= (eline, ecol)
  if sline > eline or (sline == eline and scol > ecol) then
    sline, eline = eline, sline
    scol, ecol = ecol, scol
  end

  -- Get all full lines in the range
  local lines = vim.api.nvim_buf_get_lines(0, sline - 1, eline, false)
  if #lines == 0 then
    return
  end

  if vmode == "V" then
    -- Linewise visual: keep full lines, no column trimming
  else
    -- Characterwise / blockwise selection:
    if #lines == 1 then
      -- Single-line selection: slice between scol and ecol
      lines[1] = string.sub(lines[1], scol, ecol)
    else
      -- Multi-line selection:
      -- First line: drop characters before scol
      lines[1] = string.sub(lines[1], scol)
      -- Last line: keep up to ecol
      lines[#lines] = string.sub(lines[#lines], 1, ecol)
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

-- Visual mode keybindings
vim.keymap.set("v", "<leader>y", function()
  visual_md_yank(false)
end, { desc = "Copy Markdown block (no path)", noremap = true, silent = true })

vim.keymap.set("v", "<leader>Y", function()
  visual_md_yank(true)
end, { desc = "Copy Markdown block (with path)", noremap = true, silent = true })

-----------------------------------------------------------------------
-- Normal mode yank: yank N lines starting at current line as Markdown
-- with a brief highlight, using modern APIs (vim.highlight.range).
-----------------------------------------------------------------------

-- Define a custom highlight group once; link it to Visual
vim.api.nvim_set_hl(0, "YankVisual", { link = "Visual" })

local function normal_md_yank(n, include_path)
  local ft = vim.bo.filetype or "text"
  local path = vim.fn.expand("%:p")

  local cur_line = vim.fn.line(".")
  local start_line = cur_line - 1
  local end_line = start_line + n

  local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

  local result = {}
  if include_path and path ~= "" then
    table.insert(result, path)
  end
  table.insert(result, "```" .. ft)
  vim.list_extend(result, lines)
  table.insert(result, "```")

  vim.fn.setreg("+", table.concat(result, "\n"))
  print("Copied " .. n .. " lines as markdown block" .. (include_path and " with path" or ""))

  -- Temporary visual highlight of the yanked range
  local ns_id = vim.api.nvim_create_namespace("custom_yank_highlight")

  vim.highlight.range(
    0, -- buffer
    ns_id, -- namespace
    "YankVisual", -- highlight group
    { start_line, 0 },
    { end_line - 1, -1 },
    { inclusive = true }
  )

  vim.defer_fn(function()
    vim.api.nvim_buf_clear_namespace(0, ns_id, start_line, end_line)
  end, 100)
end

-- Normal mode keybindings
vim.keymap.set("n", "<leader>yj", function()
  local count = vim.v.count ~= 0 and vim.v.count or 1
  normal_md_yank(count, false)
end, { desc = "Yank N lines as markdown (no path)", noremap = true, silent = true })

vim.keymap.set("n", "<leader>Yj", function()
  local count = vim.v.count ~= 0 and vim.v.count or 1
  normal_md_yank(count, true)
end, { desc = "Yank N lines as markdown (with path)", noremap = true, silent = true })
