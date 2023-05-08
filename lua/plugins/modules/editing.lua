-- general editing and stuff

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
    },

    cmd = "Telescope",

    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--with-filename",
          "--vimgrep",
          "--smart-case",
        },
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

      extensions = {
        fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
      }
    },

    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("fzy_native")
    end,
  },

  {
    "folke/trouble.nvim",
    event = "VeryLazy",

    config = function()
      require("trouble").setup({
        auto_start = true,
        auto_close = true,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSInstall",
    event = "VimEnter",

    build = function()
      vim.cmd.TSUpdate()
    end,

    init = function()
      require("nvim-treesitter.configs").setup({
        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        }
      })
    end,
  },
}
