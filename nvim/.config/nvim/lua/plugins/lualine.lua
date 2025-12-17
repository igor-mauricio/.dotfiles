return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Define the colors for your new black theme
    local black_theme = {
      -- Normal mode (Active Window)
      normal = {
        a = { fg = "#FFFFFF", bg = "none" }, -- White text on Black BG
        b = { fg = "#CCCCCC", bg = "none" }, -- Lighter gray text on Black BG
        c = { fg = "#AAAAAA", bg = "none" }, -- Gray text on Black BG
        x = { fg = "#AAAAAA", bg = "none" },
        y = { fg = "#CCCCCC", bg = "none" },
        z = { fg = "#FFFFFF", bg = "none" },
      },
      -- Insert/Visual/Replace modes will inherit colors from your main colorscheme,
      -- but this forces the background to black for a consistent look across modes.
      insert = {
        a = { bg = "none" },
        b = { bg = "none" },
        c = { bg = "none" },
        x = { bg = "none" },
        y = { bg = "none" },
        z = { bg = "none" },
      },
      visual = {
        a = { bg = "none" },
        b = { bg = "none" },
        c = { bg = "none" },
        x = { bg = "none" },
        y = { bg = "none" },
        z = { bg = "none" },
      },
      replace = {
        a = { bg = "none" },
        b = { bg = "none" },
        c = { bg = "none" },
        x = { bg = "none" },
        y = { bg = "none" },
        z = { bg = "none" },
      },

      -- Inactive Window Status Line
      inactive = {
        a = { fg = "#555555", bg = "none" }, -- Darker gray text on Darker Black BG
        b = { fg = "#555555", bg = "none" },
        c = { fg = "#555555", bg = "none" },
        x = { fg = "#555555", bg = "none" },
        y = { fg = "#555555", bg = "none" },
        z = { fg = "#555555", bg = "none" },
      },
    }

    -- Assign the new custom theme
    opts.options.theme = black_theme

    -- Return the modified options table to LazyVim
    return opts
  end,
}
