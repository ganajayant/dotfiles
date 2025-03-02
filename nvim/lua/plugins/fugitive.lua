return {
	"tpope/vim-fugitive",
	cmd = "Git",
	keys = {
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
		{ "<leader>gl", "<cmd>Git pull<cr>", desc = "Git pull" },
		{ "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff" },
		{ "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
	},
}
