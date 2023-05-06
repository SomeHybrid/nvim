-- general editing and stuff

return {
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",

    opts = {
      auto_open = true,
      auto_close = true,
    },

    config = function(_, opts)
      require("trouble").setup(opts)
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = "<C-CR>",
          },
        },
      })
    end,
  },
}
