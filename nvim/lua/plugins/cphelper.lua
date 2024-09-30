return {
	"p00f/cphelper.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.cmd([[
        autocmd FileType Results setlocal foldlevel=5
        ]])
		vim.g["cph#lang"] = "cpp"
		vim.g["cph#dir"] = "./"
		vim.g["cph#cpp#compile_command"] = "g++ -std=c++17 solution.cpp -o cpp.out"
		vim.g["cph#vsplit"] = true
	end,
}
