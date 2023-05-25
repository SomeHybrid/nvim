return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "Update", "MasonUpdateAll", },
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall", },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",

    dependencies = {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

      "hrsh7th/cmp-nvim-lsp",

      "lukas-reineke/lsp-format.nvim",
      "folke/neodev.nvim",

      "mfussenegger/nvim-dap",
      "jay-babu/mason-nvim-dap.nvim",
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
          max_concurrent_installers = 20, -- install ALL the packages
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
              },
            },
            capabilities = capabilities,
            on_attach = attach,
          })
        end,
      })

      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })

      require("mason-nvim-dap").setup({})
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    dependencies = "nvim-tree/nvim-web-devicons",

    keys = {
      { "gd", "<cmd>Lspsaga goto_definition<CR>", desc = "Go to definition", },
      { "gp", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition", },
    },

    config = function()
      require("lspsaga").setup({})
    end,
  },
}
