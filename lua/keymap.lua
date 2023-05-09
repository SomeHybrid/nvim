local utils = require("utils")

local telescope = require("telescope.builtin")

local keymaps = {
  n = {
    ["<leader>"] = {

      f = {
        f = { telescope.find_files, desc = "Find files", },
        g = { telescope.live_grep, desc = "Find occurence of item", },
        o = { telescope.oldfiles, desc = "Recent history", },
        b = { require("telescope").extensions.file_browser.file_browser, desc = "File browser", },
      },

      -- LSP
      pd = {
        "<cmd>Lspsaga preview_definition<CR>",
        {
          desc = "Preview definition"
        },
      },
      g = {
        d = {
          "<cmd>Lspsaga goto_definition<CR>",
          {
            desc = "Goto definition"
          },
        },
        r = {
          "<cmd>Lspsaga rename<CR>",
          {
            desc = "Rename"
          },
        },
      },

      ["<Tab>"] = {
        ["1"] = {
          "<cmd>tabfirst<cr>",
          {
            desc = "First tab"
          },
        },
        ["9"] = {
          "<cmd>tablast<cr>",
          {
            desc = "Last tab"
          },
        },
        ["<Right>"] = {
          "<cmd>tabnext<cr>",
          {
            desc = "Next Tab"
          },
        },
        ["<Left>"] = {
          "<cmd>tabprevious<cr>",
          {
            desc = "Previous Tab"
          },
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
