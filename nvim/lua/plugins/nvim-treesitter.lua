return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({})
		local langs = {
			"bash",
			"c",
			"cpp",
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
		require("nvim-treesitter").install(langs)
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})

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
