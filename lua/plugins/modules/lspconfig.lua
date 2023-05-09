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
    event = { "BufReadPre", "BufNewFile" },

    dependencies = {
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
}
