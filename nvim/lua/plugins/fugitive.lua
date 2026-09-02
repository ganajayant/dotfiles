return {
	"tpope/vim-fugitive",
	cmd = "Git",
	keys = {
		{ "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
		{ "<leader>gbl", "<cmd>Git blame<cr>", desc = "Git blame" },
	},
}
