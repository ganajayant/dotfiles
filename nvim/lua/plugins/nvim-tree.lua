return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = { "NvimTreeToggle", "NvimTreeFocus" },
	keys = {
		{ "<leader>t", "<cmd>NvimTreeToggle<CR>", desc = "NvimTree Toggle" },
	},
	opts = {
		on_attach = function(bufnr)
			local api = require("nvim-tree.api")
			api.config.mappings.default_on_attach(bufnr)
		end,
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
			relativenumber = true,
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = false,
			custom = { "node_modules/.*" },
		},
		log = {
			enable = true,
			truncate = true,
			types = {
				diagnostics = true,
				git = true,
				profile = true,
				watcher = true,
			},
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
		if vim.fn.argc(-1) == 0 then
			vim.cmd("NvimTreeFocus")
		end
	end,
}
