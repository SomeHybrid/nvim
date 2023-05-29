return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",

    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-path",

      {
        "L3MON4D3/LuaSnip",

        build = (not jit.os:find("Windows"))
            and "make install_jsregexp"
            or nil,

        dependencies = {
          "rafamadriz/friendly-snippets",
          "saadparwaiz1/cmp_luasnip",
        },

        config = function()
          require("luasnip/loaders/from_vscode").lazy_load()
        end,
      },
    },

    opts = function()
      local icons = require("utils").icons.types
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.scroll_docs(-4),
          ["<C-j>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Esc>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp",   priority = 900, },
          { name = "treesitter", priority = 1000, },
          { name = "buffer",     priority = 800, },
          { name = "path",       priority = 600, },
          { name = "luasnip",    priority = 400, },
        }),
        formatting = {
          format = function(_, item)
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
      }
    end,
  },

  {
    "zbirenbaum/copilot.lua",

    event = "InsertEnter",

    keys = {
      {
        "<Tab>",
        function()
          local suggestion = require("copilot.suggestion")

          if suggestion.is_visible() then
            suggestion.accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end,
        desc = "Accept suggestion",
        mode = "i",
      },
    },

    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = false,
          },
        },
      })
    end,
  },
}
