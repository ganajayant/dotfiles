vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Remove trailing whitespace on save",
	group = vim.api.nvim_create_augroup("AutoGroupCmd", { clear = true }),
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
