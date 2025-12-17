return {
  -- 1. Target the lspconfig plugin
  "neovim/nvim-lspconfig",

  -- 2. Use the on_attach hook to set up the server
  opts = {
    -- This block is where LazyVim handles the general LSP setup
    -- We will add our specific clangd configuration here
    inlay_hints = { enabled = false },
    diagnostics = {
      -- Configuration for virtual text (the text next to the code)
      virtual_text = {
        -- Set the minimum severity level to display.
        -- 1: Error
        -- 2: Warning
        -- 3: Information
        -- 4: Hint
        severity = { min = vim.diagnostic.severity.ERROR },
        -- You can also disable virtual text entirely if you prefer:
        -- disable = true,
      },
      -- Configuration for signs (icons in the gutter)
      signs = {
        -- Set the minimum severity level for signs as well
        severity = { min = vim.diagnostic.severity.ERROR },
      },
    },
    servers = {
      -- Define the configuration for clangd
      clangd = {
        -- Your custom command arguments (cmd) go here
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

        -- Note: LazyVim automatically provides 'on_attach' and 'capabilities'
        -- unless you explicitly override them here. By putting your 'cmd'
        -- inside the 'clangd' table within 'servers', it merges correctly.
      },
    },
  },
}
