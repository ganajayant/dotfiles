local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local language = "cpp"
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local list_snips = function()
	local ft_list = require("luasnip").available()[vim.o.filetype]
	local ft_snips = {}
	for _, item in pairs(ft_list) do
		ft_snips[item.trigger] = item.name
	end
	print(vim.inspect(ft_snips))
end

vim.api.nvim_create_user_command("SnipList", list_snips, {})
vim.keymap.set("i", "<C-c>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

local load_snippet = function(file_name)
	local home = os.getenv("HOME")
	local path = home .. "/.config/nvim/lua/snippets/" .. file_name
	local f = io.open(path)
	assert(f)
	local fstr = f:read("*a")
	f:close()
	return fstr
end

ls.add_snippets("all", {
	s(
		"todo",
		fmt(
			[[
        {}
        ]],
			{
				c(1, { t("TODO"), t("TODO:"), t("DONE"), t("DONE:"), t("WARN:"), t("ERROR:") }),
			}
		)
	),
})

local fori = s(
	"fori",
	fmt(
		[[
    for(int {} = {}; {} < {};{}++){{
      {}
    }}
    ]],
		{
			i(1, "i"),
			i(2, "0"),
			rep(1),
			i(3, "n"),
			rep(1),
			i(0),
		}
	)
)

local beg = s("beg", fmt(load_snippet("cpp/beg.snippet"), { i(1) }))

local dbg_impl = s("dbg_impl", fmt(load_snippet("cpp/dbg_impl.snippet"), {}))

local bin_exp = s("bin_exp", fmt(load_snippet("cpp/bin_exp.snippet"), {}))

local make_snippet = ls.parser.parse_snippet

local remove_dups = make_snippet("remove_dups", "cpp/remove_dups.snippet")
local matrix = make_snippet("matrix", load_snippet("cpp/matrix.snippet"))
local sort = make_snippet("sort", "sort(${1:arr}.begin(), $1.end());\n$0")
local all = make_snippet("all", "${1:arr}.begin(), $1.end()")
local print_vec = make_snippet("print_vec", load_snippet("cpp/print_vec.snippet"))
local range = make_snippet("range", load_snippet("cpp/range.snippet"))
local seives = make_snippet("seives", load_snippet("cpp/seives.snippet"))
local nxt = make_snippet("nxt", load_snippet("cpp/nxt.snippet"))
local mysnippets = { fori, beg, sort, all, dbg_impl, bin_exp, matrix, remove_dups, print_vec, nxt, range, seives }

ls.add_snippets(language, mysnippets)

vim.keymap.set("n", "<leader><leader>s", "<cmd> source ~/.config/nvim/lua/snippets/cf-cpp.lua<CR>")
