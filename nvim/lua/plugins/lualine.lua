return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			sections = {
				lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
			},
			options = {
				icons_enabled = true,
				theme = "rose-pine",
				component_separators = "|",
				section_separators = { left = "", right = "" },
			},
		})
	end,
}
