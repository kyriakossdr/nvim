return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function ()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    event = { "BufEnter" },
    config = function()
      require("nvim-treesitter").setup({

        ensure_installed = {"bash", "javascript", "typescript", "tsx", "json", "markdown", "python", "css", "html", "go", "lua" },

        sync_install = false,

        auto_install = true,

        indent = {
          enable = true,
        },

        highlight = {
          enable = true,
        },

        autopairs = {
          enable = true,
        },

        autotag = {
          enable = true,
        },
      })
    end
  },
  {
		-- Additional text objects for treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			local tsc = require("treesitter-context")

			tsc.setup({
				enable = false,
				max_lines = 1,
				trim_scope = "inner",
			})
		end,
	},
}
