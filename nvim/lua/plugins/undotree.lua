return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree" },
	},
	config = function()
		vim.g.undotree_SplitWidth = 50
		vimfg.undotree_DiffAutoOpen = 0
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_RelativeTimestamp = 1
		vim.g.undotree_ShortIndicators = 1
	end,
}
