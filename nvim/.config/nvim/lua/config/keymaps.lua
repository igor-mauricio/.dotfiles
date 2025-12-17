vim.keymap.set({ "n", "x" }, "s", "<Nop>")
vim.keymap.set({ "n", "x" }, "q", "<Nop>")

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end
vim.keymap.set("n", "<leader>z", require("telescope").extensions.zoxide.list)
vim.keymap.set({ "n", "i" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "i" }, "<C-u>", "<C-u>zz")

-- Make "change" operations use black-hole register
vim.keymap.set({ "n", "v" }, "c", '"_c', { noremap = true })
vim.keymap.set({ "n", "v" }, "s", '"_s', { noremap = true })
vim.keymap.set({ "n", "v" }, "x", '"_x', { noremap = true })
vim.keymap.set({ "x" }, "p", '"_dP')

function smart_close()
  -- Get all listed, normal buffers
  local listed = vim.fn.getbufinfo({ buflisted = 1 })
  local normal = {}

  for _, b in ipairs(listed) do
    local bt = vim.api.nvim_buf_get_option(b.bufnr, "buftype")
    if bt == "" then
      table.insert(normal, b)
    end
  end

  -- If more than one normal buffer exists, just delete the current one
  if #normal > 1 then
    vim.cmd("bd")
    return
  end

  -- If this is the last normal buffer:
  -- delete it THEN open Snacks dashboard
  local current = vim.api.nvim_get_current_buf()

  -- delete safely
  if vim.api.nvim_buf_is_valid(current) then
    vim.cmd("bd")
  end

  -- Open the dashboard after deletion settles
  vim.schedule(function()
    local ok, snacks = pcall(require, "snacks")
    if ok and snacks.dashboard and snacks.dashboard.open then
      snacks.dashboard.open()
    end
  end)
end

vim.keymap.set("n", "<leader>bd", function()
  smart_close()
end, { desc = "Smart close buffer with dashboard fallback" })
