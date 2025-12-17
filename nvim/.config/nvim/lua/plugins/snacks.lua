-- lazy.nvim
return {
  "folke/snacks.nvim",
  opts = {
    indent = {
      enabled = false, -- enable indent guides on startup
      scope = { enabled = true }, -- optional: highlight current scope
    },
    explorer = {
      enabled = false,
    },

    dashboard = {
      preset = {
        header = [[
                                                                    
       ████ ██████           █████      ██                    
      ███████████             █████                            
      █████████ ███████████████████ ███   ███████████  
     █████████  ███    █████████████ █████ ██████████████  
    █████████ ██████████ █████████ █████ █████ ████ █████  
  ███████████ ███    ███ █████████ █████ █████ ████ █████ 
 ██████  █████████████████████ ████ █████ █████ ████ ██████
 ]],
      },
      width = 72,
      sections = {
        {
          section = "header",
          align = "center",
          height = 11,
          width = 72,
          padding = 1,
        },
        {
          align = "center",
          padding = 1,
          text = {
            { "  Lazy ", hl = "@property" },
            { "  Restore ", hl = "@property" },
            { "  Config ", hl = "@property" },
            { "  Zoxide ", hl = "@property" },
            { "  Grep ", hl = "@property" },
            { "  Files ", hl = "@property" },
          },
        },
        { section = "startup", padding = 1 },
        -- { icon = "󰏓 ", hl = "@property", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { icon = " ", hl = "@property", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { text = "", action = ":lua Snacks.dashboard.pick('files', { cwd = vim.fn.stdpath('config') })", key = "c" },
        { text = "", section = "session", key = "r" },
        { text = "", action = ":Lazy", key = "l" },
        { text = "", action = ":lua Snacks.dashboard.pick('live_grep')", key = "g" },
        { text = "", action = ":lua Snacks.dashboard.pick('oldfiles')", key = "f" },
        { text = "", key = "q", action = ":qa" },
        { text = "", key = "z", action = ":Telescope zoxide list" },
      },
    },
  },
}
