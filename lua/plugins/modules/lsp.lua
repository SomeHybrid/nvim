return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  event = "VeryLazy",

  config = function()
    local lsp = require('lsp-zero').preset("recommended")

    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)

    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()

    local cmp = require("cmp")
    cmp.setup({
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({select = true}),
      }
    })
  end,

  dependencies = {
    "neovim/nvim-lspconfig",

    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",

      dependencies = "williamboman/mason-lspconfig.nvim",
    },

      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
  },
}
