return {
	"sponkurtus2/angelic.nvim",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("angelic")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
		vim.api.nvim_set_hl(0, "CursorLine", {
			bg = "#1a1a1a",
		})
		vim.opt.cursorline = true
	end,
}
