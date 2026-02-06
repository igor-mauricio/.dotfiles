return {
  {
    "loctvl842/monokai-pro.nvim",
    commit = "8d43e7746754c2dc6e8b797cbcdd361b46086675",
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
          "lualine",
        },
        plugins = {
          bufferline = { underline_selected = false, underline_visible = false },
          indent_blankline = { context_highlight = "default", context_start_underline = false },
        },
      })
      vim.cmd.colorscheme("monokai-pro")
      vim.schedule(function()
        require("lualine").setup({})
      end)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local theme = require("lualine.themes.monokai-pro")
      local transparent_sections = { "b", "c", "x", "y", "z" }
      for _, mode in pairs(theme) do
        for _, section in ipairs(transparent_sections) do
          if mode[section] then
            mode[section].bg = "none"
          end
        end
      end
      opts.options.theme = theme
      return opts
    end,
  },
}
