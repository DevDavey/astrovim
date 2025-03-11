return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  config = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>k", "<cmd>CodeCompanion<CR>", desc = "Inline" },
    { "<leader>j", "<cmd>CodeCompanionChat<CR>", desc = "Chat" },
  },
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "copilot",
    },
    agent = {
      adapter = "copilot",
    },
  },
  adapters = {
    copilot = function()
      return require("codecompanion.adapters").extend("copilot", {
        schema = {
          model = {
            default = "claude-3.5-sonnet",
          },
        },
      })
    end,
  },
}
