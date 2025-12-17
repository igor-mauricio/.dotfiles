return {
  -- The plugin name must match the one used by LazyVim
  {
    "akinsho/bufferline.nvim",
    -- 'opts' is the table that will be passed to require('bufferline').setup()
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
