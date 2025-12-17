return {
  {
    "LazyVim/LazyVim",
    init = function()
      local function set_transparent_statusline()
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
      end

      -- run at startup
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = set_transparent_statusline,
      })

      -- run AFTER any colorscheme re-applies highlight
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          vim.defer_fn(set_transparent_statusline, 20)
        end,
      })
    end,
    opts = {
      highlights = {
        DiagnosticSignError = { bg = "none" },
        DiagnosticSignWarn = { bg = "none" },
        DiagnosticSignInfo = { bg = "none" },
        DiagnosticSignHint = { bg = "none" },
        DiagnosticSignOk = { bg = "none" },

        SignColumn = { bg = "none" },
      },
    },
  },
}
