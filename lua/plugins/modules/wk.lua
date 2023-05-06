return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  
  dependencies = "nvim-tree/nvim-web-devicons",

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 10
    require("which-key").setup({})
  end,
}
