-- partially taken from lazyvim

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },

  {
    "tamton-aquib/staline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = { "BufReadPost", "BufNewFile", },

    config = function()
      require('stabline').setup {
        style = "arrow",
        fg = "white",
        font_active = "none",
      }

      require("staline").setup({
        sections = {
          left  = {
            " ", "right_sep_double", "-mode", "left_sep_double", " ",
            "right_sep", "-file_name", "left_sep", " ",
            "right_sep_double", "-branch", "left_sep_double", " ",
          },
          mid   = { "lsp", },
          right = {
            "right_sep", "-cool_symbol", "left_sep", " ",
            "right_sep", "- ", "-lsp_name", "- ", "left_sep", " ",
            "right_sep_double", "-line_column", "left_sep_double", " ",
          }
        },

        defaults = {
          fg = "#91b1dc",
          left_separator = "",
          right_separator = "",
          true_colors = true,
          line_column = "[%l:%c] ≡%p%% "
        },

        mode_colors = {
          n = "#181a23",
          i = "#181a23",
          c = "#181a23",
          v = "#181a23",
          ic = "#181a23",
        },
      })
    end,
  },

  {
    "goolord/alpha-nvim",
    event = "VimEnter",

    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
        ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
        ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
        ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
        ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
      ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      }
      return dashboard
    end,

    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = stats.count .. " plugins loaded in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile", },
    opts = {
      char = "│",
      filetype_exclude = { "help", "alpha", "dashboard", "Trouble", "lazy", "mason" },
      show_trailing_blankline_indent = false,
      show_current_context = false,
    },
  },

  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile", },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require("mini.indentscope").setup(opts)
    end,
  },

  {
    "folke/noice.nvim",
    event = "VeryLazy",

    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },

    config = function()
      vim.notify = require("notify")

      require("noice").setup({
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        },
      })
    end
  },
}
