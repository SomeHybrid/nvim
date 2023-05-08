local utils = require("utils")

local options = {
  number = true,
  relativenumber = true,

  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  smartindent = true,
  
  termguicolors = true,
}

local globals = {
  mapleader = " ",
}

utils.load_options(options, globals)
