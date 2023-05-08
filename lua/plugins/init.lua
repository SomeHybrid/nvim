local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
  "git",
  "clone",
  "--filter=blob:none",
  "https://github.com/folke/lazy.nvim.git",
  "--branch=stable", -- latest stable release
  lazypath,
})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  "plugins.modules",
  {
    defaults = {
      lazy = true,
    },

    install = {
      colorscheme = { "tokyonight", },
    },

    performance = {
      rtp = {
        disabled_plugins = {
          "matchparen",
          "netrwPlugin",
          "matchit",
          "gzip",
          "tarPlugin",
          "tohtml",
          "zipPlugin",
          "editorconfig",
        },
      },
    },
  }
)
