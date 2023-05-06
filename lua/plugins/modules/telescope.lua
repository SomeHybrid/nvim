return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  cmd = "Telescope",

  opts = {
    defaults = {
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        vertical = {
          mirror = false,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },

      color_devicons = true,
      prompt_prefix = "   ",
    },
  },

  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    require("telescope").load_extension("fzf")
  end,
}
