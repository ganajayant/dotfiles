return {
	"folke/trouble.nvim",
	cmd = "Trouble",
	opts = {},
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics (Trouble)" },
		{ "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
		{ "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
		{ "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
		{ "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
	},
}
