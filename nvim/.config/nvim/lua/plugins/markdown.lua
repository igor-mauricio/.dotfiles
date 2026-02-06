return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "saghen/blink.compat",
    },
    keys = {
      { "<leader>on", "<cmd>ObsidianNew<cr>", desc = "New Obsidian note", mode = "n" },
      { "<leader>o/", "<cmd>ObsidianSearch<cr>", desc = "Search Obsidian notes", mode = "n" },
      { "<leader>oo", "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick Switch", mode = "n" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<cr>", desc = "Show location list of backlinks", mode = "n" },
      { "<leader>ot", "<cmd>ObsidianToday<cr>", desc = "Today note", mode = "n" },
      { "<leader>oy", "<cmd>ObsidianYesterday<cr>", desc = "Yesterday note", mode = "n" },
      { "<leader>od", "<cmd>ObsidianDailies<cr>", desc = "Daily notes", mode = "n" },
      {
        "<leader>oe",
        "<cmd>ObsidianExtractNote<cr>",
        desc = "Extracts visually selected note creates a new one with link",
        mode = "n",
      },
      {
        "<leader>oc",
        ":lua require('obsidian').util.toggle_checkbox()<cr>",
        desc = "Cycle through checkbox options.",
        mode = { "n" },
      },
      {
        "<leader>oc",
        ":g/^/lua require('obsidian').util.toggle_checkbox()<cr><Esc><Esc>",
        mode = "v",
        desc = "Toggle checkbox on selected lines",
      },
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vault",
        },
      },
      daily_notes = {
        folder = "dailies",
      },
      notes_subdir = "fleeting",
      new_notes_location = "notes_subdir",
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>ti"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
      completion = {
        nvim_cmp = true,
        -- blink = true,
        min_chars = 1,
      },
      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        -- This is equivalent to the default behavior.
        local path = spec.dir / tostring(spec.title)
        return path:with_suffix(".md")
      end,

      -- Optional, customize how wiki links are formatted. You can set this to one of:
      --  * "use_alias_only", e.g. '[[Foo Bar]]'
      --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
      --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
      --  * "use_path_only", e.g. '[[foo-bar.md]]'
      -- Or you can set it to a function that takes a table of options and returns a string, like this:
      wiki_link_func = function(opts)
        return require("obsidian.util").wiki_link_id_prefix(opts)
      end,

      -- Optional, customize how markdown links are formatted.
      markdown_link_func = function(opts)
        return require("obsidian.util").markdown_link(opts)
      end,
      ui = {
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
          ["!"] = { char = "", hl_group = "ObsidianImportant" },
        },
        bullets = { char = "•", hl_group = "ObsidianBullet" },
        external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      },
    },
  },
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    opts = {
      backend = "kitty", -- or "wezterm"
      processor = "magick_cli",
      integrations = {
        markdown = {
          enabled = true,
          only_render_image_at_cursor = true,
          clear_in_insert_mode = true,
        },
      },
      max_width = 80,
      max_height = 20,
      window_overlap_clear_enabled = true,
    },
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      "3rd/image.nvim",
    },
    opts = {
      -- Disable automatic rendering for manual-only workflow
      events = {
        render_buffer = {}, -- Empty = no automatic rendering
        clear_buffer = { "BufLeave" },
      },

      renderer_options = {
        mermaid = {
          background = "transparent",
          theme = "dark",
          scale = 10,
        },
      },
    },
    keys = {
      {
        "<leader>ov",
        function()
          -- 1. Clear all rendered images (image.nvim API)
          local ok_image, image = pcall(require, "image")
          if ok_image and image.clear then
            image.clear()
          end

          -- 2. Small delay to let tmux/wezterm repaint
          -- vim.cmd("vsplit")
          vim.defer_fn(function()
            require("diagram").show_diagram_hover()
          end, 30)
        end,
        mode = "n",
        ft = { "markdown", "norg" },
        desc = "Show diagram (force redraw)",
      },
    },
  },
  {
    "HakonHarnes/img-clip.nvim",
    event = "VeryLazy",
    opts = {
      default = {
        dir_path = "assets/imgs",
        relative_to_current_file = true,
        prompt_for_file_name = false,
        use_absolute_path = false,
      },
    },
    keys = {
      {
        "<leader>op",
        "<cmd>PasteImage<cr>",
        desc = "Paste image (img-clip)",
        mode = "n",
      },
    },
  },
}
