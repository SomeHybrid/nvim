local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts = vim.tbl_deep_extend("keep", opts, { noremap = true, })
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, { desc = "Find files" })
map("n", "<leader>fg", telescope.live_grep, { desc = "Find occurence of item" })
map("n", "<leader>o", telescope.oldfiles, { desc = "Recent history" })

map("n", "<leader><tab>1", "<cmd>tabfirst<cr>", { desc = "First tab" })
map("n", "<leader><tab>9", "<cmd>tablast<cr>", { desc = "Last tab" })
map("n", "<leader><tab><Right>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab><Left>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader><tab>t", "<cmd>tabnew<cr>", { desc = "New Tab" })
