return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = true,
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			desc = "Harpoon add file",
		},
		{
			"<leader>h",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			desc = "Harpoon quick menu",
		},
		{
			"<C-b>",
			function()
				require("harpoon"):list():select(1)
			end,
			desc = "Harpoon select 1",
		},
		{
			"<C-n>",
			function()
				require("harpoon"):list():select(2)
			end,
			desc = "Harpoon select 2",
		},
		{
			"<C-m>",
			function()
				require("harpoon"):list():select(3)
			end,
			desc = "Harpoon select 3",
		},
		{
			"<C-,>",
			function()
				require("harpoon"):list():select(4)
			end,
			desc = "Harpoon select 4",
		},
	},
	config = function()
		require("harpoon"):setup()
	end,
}
