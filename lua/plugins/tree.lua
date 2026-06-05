return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		local tree = require("nvim-tree")
		local api = require("nvim-tree.api")

		local nvimTreeFocusOrToggle = function()
			local nvimTree = require("nvim-tree.api")
			local currentBuf = vim.api.nvim_get_current_buf()
			local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
			if currentBufFt == "NvimTree" then
				nvimTree.tree.toggle()
			else
				nvimTree.tree.focus()
			end
		end

		tree.setup({
			select_prompts = true,
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				adaptive_size = false,
				width = 24,
				side = "right",
			},
			renderer = {
				group_empty = true,
				highlight_git = true,
				highlight_diagnostics = true,
				icons = {
					webdev_colors = false,
					git_placement = "after",
					modified_placement = "after",
					show = {
						file = true,
						folder = true,
						folder_arrow = false,
						git = true,
					},
					glyphs = {
						git = {
							unstaged = "U",
							staged = "A",
							unmerged = "M",
							renamed = "R",
							untracked = "?",
							deleted = "D",
							ignored = "!",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = false,
			},
			log = {
				enable = true,
				types = {
					git = true,
				},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
			},
		})

		vim.keymap.set("n", "<C-b>", nvimTreeFocusOrToggle)
		vim.keymap.set("n", "?", api.tree.toggle_help, { noremap = true, silent = true, nowait = true })

		-- automatically resize the floating window when neovim's window size changes
		vim.api.nvim_create_augroup("NvimTreeResize", {
			clear = true,
		})

		vim.api.nvim_create_autocmd({ "VimResized", "WinResized" }, {
			group = "NvimTreeResize",
			callback = function()
				local winid = api.tree.winid()
				if winid then
					api.tree.reload()
				end
			end,
		})
	end,
}
