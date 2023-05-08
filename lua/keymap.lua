local utils = require("utils")

local telescope = require("telescope.builtin")

local keymaps = {
  ["<leader><tab>1"] = { "<cmd>tabfirst<cr>", { desc = "First tab" } },
  ["<leader><tab>9"] = { "<cmd>tablast<cr>", { desc = "Last tab" } },
  ["<leader><tab><Right>"] = { "<cmd>tabnext<cr>", { desc = "Next Tab" } },
  ["<leader><tab><Left>"] = { "<cmd>tabprevious<cr>", { desc = "Previous Tab" } },
  ["<leader><tab>t"] = { "<cmd>tabnew<cr>", { desc = "New Tab" } },

  ["<leader>ff"] = { telescope.find_files, { desc = "Find files" } },
  ["<leader>fg"] = { telescope.live_grep, { desc = "Find occurence of item" } },
  ["<leader>fo"] = { telescope.oldfiles, { desc = "Recent history" } },
  ["<leader>fb"] = { require("telescope").extensions.file_browser.file_browser, { desc = "File browser" }, },

  ["<C-h>"] = { "<C-w>h", { desc = "Go to left window" } },
  ["<C-j>"] = { "<C-w>j", { desc = "Go to lower window" } },
  ["<C-k>"] = { "<C-w>k", { desc = "Go to upper window" } },
  ["<C-l>"] = { "<C-w>l", { desc = "Go to right window" } },

  ["j"] = { "v:count == 0 ? 'gj' : 'j'", { expr = true } },
  ["k"] = { "v:count == 0 ? 'gk' : 'k'", { expr = true } },

  ["<S-Enter>"] = { "O<Esc>", { desc = "Insert new line" } },

  ["<leader>pd"] = { "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek definition" } },
  ["<leader>gd"] = { "<cmd>Lspsaga goto_definition<CR>", { desc = "Go to definition" } },
  ["<leader>gr"] = { "<cmd>Lspsaga rename<CR>", { desc = "Rename item" } },
}

utils.load_mappings(keymaps)
