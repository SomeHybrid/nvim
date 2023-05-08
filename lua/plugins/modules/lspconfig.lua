return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "lukas-reineke/lsp-format.nvim",
      "folke/neodev.nvim",
    },

    config = function()
      require("mason").setup(
        {
          ui = {
            icons = {
              package_installed = "󰗠 ",
              package_pending = " ",
              package_uninstalled = " ",
            },
          },
          max_concurrent_installers = 15, -- install ALL the packages
        }
      )

      local mlsp = require("mason-lspconfig")
      local lspconfig = require("lspconfig")

      require("neodev").setup({})

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mlsp.setup()
      local attach = require("lsp-format").on_attach

      mlsp.setup_handlers({
        function(server)
          lspconfig[server].setup({
            capabilities = capabilities,
            on_attach = attach
          })
        end,

        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                workspace = {
                  checkThirdParty = false,
                },
                completion = {
                  callSnippet = "Replace"
                },
                diagnostics = {
                  globals = { "vim", },
                },
              },
            },
            capabilities = capabilities,
            on_attach = attach,
          })
        end,
      })
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = "nvim-tree/nvim-web-devicons",

    config = function()
      require("lspsaga").setup({})
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
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
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,

    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
}
