return {
  -- Override the default blink.cmp configuration
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      -- 'opts' is the existing blink.cmp configuration table

      -- Ensure 'obsidian' and 'obsidian_tags' are in your list of enabled completion providers
      -- They should usually be compatible via 'blink.compat'.

      -- Example of explicitly adding/checking sources:
      local completion = opts.sources.completion
      if completion and completion.enabled_providers then
        -- Add 'obsidian' and 'obsidian_tags' if they are missing
        local added_obsidian = false
        local added_tags = false
        for _, provider in ipairs(completion.enabled_providers) do
          if provider == "obsidian" then
            added_obsidian = true
          end
          if provider == "obsidian_tags" then
            added_tags = true
          end
        end

        if not added_obsidian then
          table.insert(completion.enabled_providers, "obsidian")
        end
        if not added_tags then
          table.insert(completion.enabled_providers, "obsidian_tags")
        end
      end

      -- If you're using blink.compat to register the sources:
      -- You might need to add the source name to the 'compat' list.
      if opts.sources and opts.sources.compat then
        local compat_sources = opts.sources.compat
        local added_obsidian = false
        for _, source in ipairs(compat_sources) do
          if source == "obsidian" then
            added_obsidian = true
          end
        end
        if not added_obsidian then
          table.insert(compat_sources, "obsidian")
        end
      end
    end,
  },
}
