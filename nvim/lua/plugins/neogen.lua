return {
	"danymat/neogen",
	config = function()
		require("neogen").setup({
			snippet_engine = "luasnip",
		})
	end,
	keys = {
		{
			"<leader>cn",
			function()
				require("neogen").generate()
			end,
			desc = "Generate docstring with Neogen",
		},
	},
}
