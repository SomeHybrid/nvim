return {
  "nvim-treesitter/nvim-treesitter",
  cmd = "TSInstall",
  event = "VimEnter",

  build = function()
    pcall(vim.cmd, "TSUpdate")
  end,

  init = function()
    require("nvim-treesitter.configs").setup({
      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      }
    })
  end,
}
