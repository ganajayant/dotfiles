return {
	{
		"mfussenegger/nvim-jdtls",
		config = function()
			local jdtls = require("jdtls")
			local cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") }
			local root_dir = vim.fn.getcwd()
			local config = {
				root_dir = root_dir,
				settings = {
					java = {
						signatureHelp = { enabled = true },
						import = { enabled = true },
						rename = { enabled = true },
					},
				},
				cmd = cmd,
			}
			jdtls.start_or_attach(config)
		end,
	},
}
