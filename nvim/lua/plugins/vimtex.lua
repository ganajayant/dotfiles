return {
	"lervag/vimtex",
	ft = { "tex", "latex" },
	config = function()
		vim.g.vimtex_format_enabled = 1
		vim.g.vimtex_format_config = {
			latexindent = {
				build_args = { "-l", "%f" },
				executable = "latexindent",
			},
		}
		vim.g.vimtex_view_method = "sioyek"
	end,
}
