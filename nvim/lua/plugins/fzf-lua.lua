return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	event = "VimEnter",
	opts = function(_, opts)
		opts.winopts = {
			preview = {
				layout = "vertical",
				vertical = "down:50%",
			},
		}
	end,
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			files = {
				cmd = "rg --files --hidden --glob '!**/.git/*' --glob '!**/node_modules/*'",
			},
		})

		-- Route vim.ui.select() (e.g. LSP code actions) through fzf-lua,
		fzf.register_ui_select()

		vim.keymap.set("n", "<leader>sf", fzf.files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>sg", fzf.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>sw", function()
			fzf.grep({ search = vim.fn.expand("<cword>") })
		end, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>sh", fzf.helptags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>sk", fzf.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[ ] Find existing buffers" })

		vim.keymap.set("n", "<leader>/", function()
			fzf.blines({ winopts = { height = 0.4, width = 0.9, row = 1 } })
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", fzf.lines, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			fzf.files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "[G]it [B]ranches" })
	end,
}
