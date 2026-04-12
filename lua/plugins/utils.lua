return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		opts = {
			direction = "vertical",
			size = 65,
			on_open = function()
				require("nvim-tree.api").tree.close()
			end,
			open_mapping = [[<c-\>]],
		},
	},

	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			bullet = {
				enabled = true,
				icons = { "•", "◦", "▸", "▹" },
			},

			checkbox = {
				enabled = true,
			},

			pipe_table = {
				enabled = true,
				style = "normal",
			},

			link = {
				enabled = true,
				image = "",
				hyperlink = "",
			},

			code = { enabled = false },
			dash = { enabled = false },
			sign = { enabled = false },
			heading = { enabled = false },
		},
	},

	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-mini/mini.icons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	},

	{
		"reybits/scratch.nvim",
		lazy = true,
		keys = {
			{ "<leader>ts", "<cmd>ScratchToggle<cr>", desc = "Toggle Scratch Buffer" },
		},
		cmd = {
			"ScratchToggle",
		},
		opts = {},
	},

	{
		"nvim-mini/mini.nvim",
		config = function()
			require("mini.pairs").setup()
			require("mini.surround").setup()
		end,
	},

	{
		"benomahony/uv.nvim",
		opts = {
			picker_integration = true,
		},
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "▏",
			},
			scope = {
				show_start = false,
				show_end = false,
				show_exact_scope = false,
			},
			exclude = {
				filetypes = {
					"help",
					"startify",
					"dashboard",
					"packer",
					"neogitstatus",
					"NvimTree",
					"Trouble",
				},
			},
		},
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			local opts = { noremap = true, silent = true }

			vim.keymap.set("n", "<C-c>", require("Comment.api").toggle.linewise.current, opts)
			vim.keymap.set(
				"v",
				"<C-c>",
				"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
				opts
			)
		end,
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local td = require("todo-comments")
			local opts = { noremap = true, silent = true }

			td.setup({ signs = false })

			vim.keymap.set("n", "]t", td.jump_next, opts)
			vim.keymap.set("n", "[t", td.jump_prev, opts)

			vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", opts)
			vim.keymap.set("n", "<leader>fq", "<cmd>TodoQuickFix<cr>", opts)
		end,
	},
}
