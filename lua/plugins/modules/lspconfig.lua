return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "lukas-reineke/lsp-format.nvim",
  },

  config = function()
    require("mason").setup()

    local mlsp = require("mason-lspconfig")
    local lspconfig = require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    mlsp.setup()
    local attach = require("lsp-format").on_attach

    mlsp.setup_handlers({
      function (server)
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
}
