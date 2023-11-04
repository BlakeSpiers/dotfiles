return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			--build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				layout_strategy = "vertical",
			},

			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files()
			end, { desc = "Find file (fuzzy)" }),

			vim.keymap.set("n", "<leader>fr", function()
				builtin.oldfiles()
			end, { desc = "Find recent file (fuzzy)" }),

			vim.keymap.set("n", "<leader>fs", function()
				builtin.live_grep()
			end, { desc = "Find string" }),

			vim.keymap.set("n", "<leader>fc", function()
				builtin.grep_string()
			end, { desc = "Find string under cursor" }),

			vim.keymap.set("n", "<leader>fb", function()
				builtin.buffers()
			end, { desc = "Find buffer" }),

			vim.keymap.set("n", "<leader>fh", function()
				builtin.help_tags()
			end, { desc = "Find help tags" }),
		})

		telescope.load_extension("fzf")
	end,
	--keys = {
	--	{
	--		"<leader>ff",
	--		function()
	--			require("telescope.builtin").find_files()
	--		end,
	--		desc = "Find file (fuzzy)",
	--	},
	--	{
	--		"<leader>fr",
	--		function()
	--			require("telescope.builtin").oldfiles()
	--		end,
	--		desc = "Find recent files (fuzzy)",
	--	},
	--	{
	--		"<leader>fs",
	--		"<cmd>Telescope live_grep<cr>",
	--		desc = "Find string",
	--	},
	--	{
	--		"<leader>fc",
	--		function()
	--			require("telescope.builtin").grep_string()
	--		end,
	--		desc = "Find string under cursor",
	--	},
	--	{
	--		"<leader>fb",
	--		function()
	--			require("telescope.builtin").buffers()
	--		end,
	--		desc = "Find buffers",
	--	},
	--	{
	--		"<leader>fh",
	--		function()
	--			require("telescope.builtin").help_tags()
	--		end,
	--		desc = "Find help tags",
	--	},
	--},
}
