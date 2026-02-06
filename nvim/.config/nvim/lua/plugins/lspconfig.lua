return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
  },
  {
    "numToStr/Comment.nvim",
    opts = function(_, opts)
      local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
      opts.pre_hook = ts_context_commentstring.create_pre_hook()
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      diagnostics = {
        virtual_text = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
        signs = {
          severity = { min = vim.diagnostic.severity.ERROR },
        },
      },
      servers = {
        clangd = {
          cmd = {
            "clangd",
            "--background-index",
            "-j=12",
            "--query-driver=**",
            "--clang-tidy",
            "--all-scopes-completion",
            "--cross-file-rename",
            "--completion-style=detailed",
            "--header-insertion-decorators",
            "--header-insertion=iwyu",
            "--pch-storage=memory",
            "--suggest-missing-includes",
          },
        },
      },
    },
  },
}
