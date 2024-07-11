return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>n",
			function()
				require("neo-tree.command").execute({
					toggle = true,
					source = "filesystem",
					position = "right",
				})
			end,
			desc = "Filesystem (root dir)",
		},
	},
}
