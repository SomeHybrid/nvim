local utils = require("utils")

local telescope = require("telescope.builtin")

local keymaps = {
  n = {
    ["<leader>"] = {
      -- Telescope
      ff = {
        telescope.find_files,
        {
          desc = "Find files"
        },
      },
      fg = {
        telescope.live_grep,
        {
          desc = "Find occurence of item"
        },
      },
      fo = {
        telescope.oldfiles,
        {
          desc = "Recent history"
        },
      },
      fb = {
        require("telescope").extensions.file_browser.file_browser,
        {
          desc = "File browser"
        },
      },

      -- LSP
      pd = {
        "<cmd>Lspsaga preview_definition<CR>",
        {
          desc = "Preview definition"
        },
      },
      gd = {
        "<cmd>Lspsaga goto_definition<CR>",
        {
          desc = "Go to definition"
        },
      },
      gr = {
        "<cmd>Lspsaga rename<CR>",
        {
          desc = "Rename item"
        },
      },

      -- Tabs
      ["<Tab>1"] = {
        "<cmd>tabfirst<cr>",
        {
          desc = "First tab"
        },
      },
      ["<Tab>9"] = {
        "<cmd>tablast<cr>",
        {
          desc = "Last tab"
        },
      },
      ["<Tab><Right>"] = {
        "<cmd>tabnext<cr>",
        {
          desc = "Next Tab"
        },
      },
      ["<Tab><Left>"] = {
        "<cmd>tabprevious<cr>",
        {
          desc = "Previous Tab"
        },
      },
      ["<Tab>t"] = {
        "<cmd>tabnew<cr>",
        {
          desc = "New Tab"
        },
      },

      j = {
        'v:count ? "k" : "gk"',
        {
          expr = true,
          desc = "Move up"
        },
      },
      k = {
        'v:count ? "j" : "gj"',
        {
          expr = true,
          desc = "Move down"
        },
      },
    },
  },

  v = {
    j = {
      'v:count ? "k" : "gk"',
      {
        expr = true,
        desc = "Move up"
      },
    },
    k = {
      'v:count ? "j" : "gj"',
      {
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
      { desc = "Accept suggestion", },
    }
  }
}

utils.load_mappings(keymaps)
