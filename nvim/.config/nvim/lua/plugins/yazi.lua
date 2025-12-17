return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
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
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    --
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrwPlugin = 1
  end,
}
