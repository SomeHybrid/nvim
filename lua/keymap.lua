local utils = require("utils")

local telescope = require("telescope.builtin")

local keymaps = {
  n = {
    ["<leader>"] = {

      f = {
        f = {
          telescope.find_files,
          opts = {
            desc = "Find files",
          },
        },
        g = {
          telescope.live_grep,
          opts = {
            desc = "Find occurence of item",
          },
        },
        o = {
          telescope.oldfiles,
          opts = {
            desc = "Recent history",
          },
        },
        b = {
          require("telescope").extensions.file_browser.file_browser,
          opts = {
            desc = "File browser",
          },
        },
      },

      -- LSP
      pd = {
        "<cmd>Lspsaga preview_definition<CR>",
        opts = {
          desc = "Preview definition"
        },
      },
      g = {
        d = {
          "<cmd>Lspsaga goto_definition<CR>",
          opts = {
            desc = "Goto definition"
          },
        },
        r = {
          "<cmd>Lspsaga rename<CR>",
          opts = {
            desc = "Rename"
          },
        },
      },

      ["<Tab>"] = {
        ["1"] = {
          "<cmd>tabfirst<cr>",
          opts = {
            desc = "First tab"
          },
        },
        ["9"] = {
          "<cmd>tablast<cr>",
          opts = {
            desc = "Last tab"
          },
        },
        ["<Right>"] = {
          "<cmd>tabnext<cr>",
          opts = {
            desc = "Next Tab"
          },
        },
        ["<Left>"] = {
          "<cmd>tabprevious<cr>",
          opts = {
            desc = "Previous Tab"
          },
        },
      },

      j = {
        'v:count ? "k" : "gk"',
        opts = {
          expr = true,
          desc = "Move up"
        },
      },
      k = {
        'v:count ? "j" : "gj"',
        opts = {
          expr = true,
          desc = "Move down"
        },
      },
    },
  },

  v = {
    j = {
      'v:count ? "k" : "gk"',
      opts = {
        expr = true,
        desc = "Move up"
      },
    },
    k = {
      'v:count ? "j" : "gj"',
      opts = {
        expr = true,
        desc = "Move down"
      },
    },
  },

  i = {
    ["<Tab>"] = {
      function()
        local suggestion = require("copilot.suggestion")

        if suggestion.is_visible() then
          suggestion.accept()
        else
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        end
      end,
      opts = { desc = "Accept suggestion", },
    }
  }
}

utils.load_mappings(keymaps)
