return {
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     style = "night",
  --     transparent = true,
  --     styles = {
  --       floats = "transparent",
  --       sidebars = "transparent",
  --     },
  --     on_colors = function(colors)
  --       colors.bg_statusline = colors.none -- To check if its working try something like "#ff00ff" instead of colors.none
  --     end,
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     -- vim.cmd.colorscheme("tokyonight-moon")
  --   end,
  -- },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
        transparent_background = true,
        terminal_colors = true,
        devicons = true,
        styles = {
          comment = { italic = true },
          keyword = { italic = true },
          type = { italic = true },
          storageclass = { italic = true },
          structure = { italic = true },
          parameter = { italic = true },
          annotation = { italic = true },
          tag_attribute = { italic = true },
        },
        filter = "classic",
        day_night = { enable = false },
        inc_search = "background",
        background_clear = {
          "float_win",
          "toggleterm",
          "telescope",
          "which-key",
          "renamer",
          "notify",
          "nvim-tree",
          "neo-tree",
          "bufferline",
        },
        plugins = {
          bufferline = { underline_selected = false, underline_visible = false },
          indent_blankline = { context_highlight = "default", context_start_underline = false },
        },
      })

      -- Apply colorscheme first
      vim.cmd.colorscheme("monokai-pro")

      vim.schedule(function()
        require("lualine").setup({})
      end)
    end,
  },
}
