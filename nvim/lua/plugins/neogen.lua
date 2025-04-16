return {
	"danymat/neogen",
	dependencies = "L3MON4D3/LuaSnip",
	opts = {
		snippet_engine = "luasnip",
	},
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
