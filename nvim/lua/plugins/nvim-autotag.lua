return {
	"windwp/nvim-ts-autotag",
	ft = {
		"html",
		"xml",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
	},
	dependencies = "nvim-treesitter/nvim-treesitter",
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
		filetypes = {
			"html",
			"xml",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"vue",
			"svelte",
		},
		per_filetype = {
			["html"] = {
				enable_close = true,
			},
		},
	},
	config = true,
}
