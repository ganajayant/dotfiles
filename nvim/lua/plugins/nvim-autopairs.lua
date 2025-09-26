return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			java = false,
		},
	},
	config = function(_, opts)
		local autopairs = require("nvim-autopairs")
		autopairs.setup(opts)
	end,
}
