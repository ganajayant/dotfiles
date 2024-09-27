return {
	{
		"dasupradyumna/midnight.nvim",
		lazy = true,
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("midnight")
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
