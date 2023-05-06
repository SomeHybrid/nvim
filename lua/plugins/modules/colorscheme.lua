return {
  {
    "folke/tokyonight.nvim",
    opts = { style = "moon" },
    init = function()
        vim.cmd.colorscheme("tokyonight")
    end,
  },
}
