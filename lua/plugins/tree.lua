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
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
				side = "right",
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})

		vim.keymap.set("n", "<C-h>", nvimTreeFocusOrToggle)
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
