return {
	{
		"datsfilipe/vesper.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("vesper")
			vim.cmd.hi("Comment gui=none")
		end,
	},
}
