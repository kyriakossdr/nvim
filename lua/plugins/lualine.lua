return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				section_separators = "",
				component_separators = "│",
				disabled_filetypes = { "alpha", "neo-tree" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { { "filename", file_status = true, path = 0 } },
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						sections = { "error", "warn", "info", "hint" },
						symbols = { error = "󰅚 ", warn = "󰀪 ", info = "󰋽 ", hint = "󰌶 " },
						colored = false,
						update_in_insert = false,
						always_visible = false,
						cond = hide_in_width,
					},
					{ "diff", colored = false, symbols = { added = " ", modified = " ", removed = " " } },
					{ "filetype", icon_only = true, cond = hide_in_width },
				},
				lualine_y = {},
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
