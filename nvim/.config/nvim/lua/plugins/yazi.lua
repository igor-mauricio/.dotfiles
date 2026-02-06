return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {
      "-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      "_",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    yazi_floating_window_border = "rounded",
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
    ---@diagnostic disable-next-line: missing-fields
    hooks = {
      yazi_closed_successfully = function(chosen_file, config, state)
        if chosen_file ~= nil then
          if vim.fn.isdirectory(chosen_file) == 1 then
            vim.notify("Changing directory to " .. chosen_file)
            vim.fn.chdir(chosen_file)
          end
        end
      end,
    },
  },
  init = function()
    vim.g.loaded_netrwPlugin = 1
  end,
}
