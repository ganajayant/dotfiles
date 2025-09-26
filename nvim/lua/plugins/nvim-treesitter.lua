return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	init = function()
		local parser_installed = {
			"bash",
			"c",
			"diff",
			"html",
			"java",
			"lua",
			"luadoc",
			"markdown",
			"toml",
			"vim",
			"vimdoc",
			"yaml",
		}

		vim.defer_fn(function()
			require("nvim-treesitter").install(parser_installed)
		end, 1000)
		require("nvim-treesitter").update()

		vim.api.nvim_create_autocmd("FileType", {
			desc = "User: enable treesitter highlighting",
			callback = function(ctx)
				local hasStarted = pcall(vim.treesitter.start)
				local noIndent = {}
				if hasStarted and not vim.list_contains(noIndent, ctx.match) then
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})
	end,
}
