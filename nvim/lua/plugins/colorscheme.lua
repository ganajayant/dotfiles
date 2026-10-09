return {
	"Shatur/neovim-ayu",
	priority = 1000,

	config = function()
		local colors = require("ayu.colors")
		colors.generate(false)

		require("ayu").setup({
			mirage = false,
			terminal = true,

			overrides = {
				Normal = {
					bg = "#0b0e14",
					fg = "#e2e8f0",
				},

				NormalNC = {
					bg = "#0b0e14",
					fg = "#e2e8f0",
				},

				NormalFloat = {
					bg = "#0b0e14",
					fg = "#e2e8f0",
				},

				FloatBorder = {
					bg = "#0b0e14",
					fg = "#686868",
				},

				SignColumn = {
					bg = "#0b0e14",
				},

				EndOfBuffer = {
					fg = "#1e232b",
				},

				CursorLine = {
					bg = "#11151c",
				},

				Visual = {
					bg = "#1b3a5b",
					fg = "#e2e8f0",
				},

				LineNr = {
					fg = "#686868",
					bg = "#0b0e14",
				},

				CursorLineNr = {
					fg = "#ffb454",
					bg = "#11151c",
					bold = true,
				},

				Cursor = {
					fg = "#0b0e14",
					bg = "#bfbdb6",
				},

				Comment = {
					fg = "#686868",
					italic = true,
				},

				["@variable"] = {
					fg = "#e2e8f0",
				},

				["@variable.builtin"] = {
					fg = "#ea6c73",
				},

				["@parameter"] = {
					fg = "#f9af4f",
				},

				["@property"] = {
					fg = "#59c2ff",
				},

				["@field"] = {
					fg = "#59c2ff",
				},

				["@function"] = {
					fg = "#ffb454",
				},

				["@function.call"] = {
					fg = "#ffb454",
				},

				["@method"] = {
					fg = "#ffb454",
				},

				["@method.call"] = {
					fg = "#ffb454",
				},

				["@keyword"] = {
					fg = "#cda1fa",
				},

				["@keyword.function"] = {
					fg = "#cda1fa",
				},

				["@keyword.return"] = {
					fg = "#cda1fa",
				},

				["@type"] = {
					fg = "#90e1c6",
				},

				["@type.builtin"] = {
					fg = "#90e1c6",
				},

				["@constructor"] = {
					fg = "#90e1c6",
				},

				["@constant"] = {
					fg = "#d2a6ff",
				},

				["@constant.builtin"] = {
					fg = "#d2a6ff",
				},

				["@string"] = {
					fg = "#7fd962",
				},

				["@string.escape"] = {
					fg = "#aad94c",
				},

				["@number"] = {
					fg = "#f9af4f",
				},

				["@boolean"] = {
					fg = "#ea6c73",
				},

				["@operator"] = {
					fg = "#f9af4f",
				},

				["@punctuation.bracket"] = {
					fg = "#e2e8f0",
				},

				["@punctuation.delimiter"] = {
					fg = "#686868",
				},

				["@tag"] = {
					fg = "#59c2ff",
				},

				["@tag.attribute"] = {
					fg = "#ffb454",
				},

				["@tag.delimiter"] = {
					fg = "#686868",
				},

				DiagnosticError = {
					fg = "#ea6c73",
				},

				DiagnosticWarn = {
					fg = "#ffb454",
				},

				DiagnosticInfo = {
					fg = "#59c2ff",
				},

				DiagnosticHint = {
					fg = "#90e1c6",
				},

				Search = {
					fg = "#0b0e14",
					bg = "#ffb454",
				},

				IncSearch = {
					fg = "#0b0e14",
					bg = "#f9af4f",
				},

				CurSearch = {
					fg = "#0b0e14",
					bg = "#f9af4f",
				},
			},
		})

		vim.cmd.colorscheme("ayu-dark")
	end,
}
