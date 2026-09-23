return {
  "nvim-mini/mini.nvim",
  version = "*",
  config = function()
    require("mini.surround").setup({
      respect_selection_type = true,
      custom_surroundings = {
        t = {
          input = { "<(%w+)[^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
          output = function()
            local tag_name = minisurround.user_input("tag name")
            if not tag_name then
              return nil
            end
            return {
              left = "<" .. tag_name .. ">",
              right = "</" .. tag_name .. ">",
            }
          end,
        },
      },
    })
  end,
}
