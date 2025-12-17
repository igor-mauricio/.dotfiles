return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set("n", "<leader>fs", function()
      require("spectre").open()
    end, { desc = "Open Spectre" })

    vim.keymap.set("v", "<leader>Sw", function()
      require("spectre").open_visual()
    end, { desc = "Search selection" })

    vim.keymap.set("n", "<leader>Sp", function()
      require("spectre").open_file_search()
    end, { desc = "Search current file" })
  end,
}
