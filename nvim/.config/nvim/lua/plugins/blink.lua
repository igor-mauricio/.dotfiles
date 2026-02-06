return {
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      local completion = opts.sources.completion
      if completion and completion.enabled_providers then
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
