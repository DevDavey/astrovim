return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    flavour = "Mocha",
    transparent_background = true,
    custom_highlights = function()
      return {
        CursorLine = { bg = "NONE" }, -- Make the cursor line background transparent
      }
    end,
  },
}
