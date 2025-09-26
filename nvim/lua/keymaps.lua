local keymap = vim.keymap

keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over selection without yanking" })

keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

keymap.set({ "n", "v" }, "<leader>p", [["+p]], { desc = "Paste from system clipboard" })
keymap.set("n", "<leader>P", [["+P]], { desc = "Paste before from system clipboard" })

keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor centered" })
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make it executable" })

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and keep cursor centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and keep cursor centered" })

keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

keymap.set("n", "ss", ":split<Return>", { noremap = true, silent = true, desc = "Horizontal split" })
keymap.set("n", "sv", ":vsplit<Return>", { noremap = true, silent = true, desc = "Vertical split" })

keymap.set("n", "sh", "<C-w>h", { desc = "Move focus to the left window" })
keymap.set("n", "sk", "<C-w>k", { desc = "Move focus to the upper window" })
keymap.set("n", "sj", "<C-w>j", { desc = "Move focus to the lower window" })
keymap.set("n", "sl", "<C-w>l", { desc = "Move focus to the right window" })

keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message (with float)" })

keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message (with float)" })

keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>', { desc = "Discourage left arrow usage" })
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>', { desc = "Discourage right arrow usage" })
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>', { desc = "Discourage up arrow usage" })
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>', { desc = "Discourage down arrow usage" })

keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

keymap.set("i", "<S-Tab>", "<C-d>", { desc = "Unindent in insert mode" })
keymap.set("v", "<S-Tab>", "<<", { desc = "Unindent in visual mode" })
keymap.set("v", "<Tab>", ">>", { desc = "Indent in visual mode" })

keymap.set("n", "<leader>pv", ":Ex<Return>", { desc = "Open up NETRW" })
