return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	init = function()
		vim.defer_fn(function()
			require("nvim-treesitter").install({
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
			})
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
		vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
			desc = "Auto-install treesitter parsers on buffer enter",
			callback = function(event)
				local bufnr = event.buf
				local filetype = vim.api.nvim_get_option_value("filetype", { buf = bufnr })
				if filetype == "" then
					return
				end
				local parser_name = vim.treesitter.language.get_lang(filetype)
				if not parser_name then
					return
				end
				local parser_configs = require("nvim-treesitter.parsers")
				local parser_can_be_used = parser_configs[parser_name]
				if not parser_can_be_used then
					return
				end
				local parser_installed = pcall(vim.treesitter.get_parser, bufnr, parser_name)
				if not parser_installed then
					vim.defer_fn(function()
						require("nvim-treesitter").install({ parser_name })
						vim.defer_fn(function()
							pcall(vim.treesitter.start, bufnr, parser_name)
						end, 500)
					end, 0)
					return
				end
				vim.treesitter.start(bufnr, parser_name)
			end,
		})
	end,
}
