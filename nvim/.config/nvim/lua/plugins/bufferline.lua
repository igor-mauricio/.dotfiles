return {
  {
    "akinsho/bufferline.nvim",
    config = function()
      require("bufferline").setup({
        options = {
          themable = false,
          show_buffer_icons = false,
        },
      })
    end,
  },
}
