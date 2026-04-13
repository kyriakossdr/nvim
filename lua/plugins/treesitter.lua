return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		ts.install({
			"yaml",
			"go",
			"lua",
			"javascript",
			"typescript",
			"jsx",
			"tsx",
			"python",
			"json",
			"toml",
			"dockerfile",
			"markdown",
			"markdown_inline",
		})
	end,
}
