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

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = { "docker-compose.yaml", "compose.yaml" },
	group = vim.api.nvim_create_augroup("ft_lsp_group", { clear = true }),
	desc = "Fix the issue where the LSP does not start with docker-compose.",
	callback = function()
		vim.opt.filetype = "yaml.docker-compose"
	end,
})
