return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "franco-ruggeri/codecompanion-spinner.nvim",
    },
    opts = {
      opts = {
        extensions = {
          spinner = {}
        },
        log_level = "DEBUG",
      }
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            name = "copilot",
            model = "gpt-4o-mini",
            keymaps = {
              send = {
                modes = { n = "<leader>cs", i = "<leader>cs" },
                opts = {}
              }
            }
          },
          inline = {
            name = "copilot",
            model = "gpt-4o-mini",
          },
        },
      })
    end
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "codecompanion" }
  },
  {
    "echasnovski/mini.diff",
    config = function()
      local diff = require("mini.diff")
      diff.setup({
        source = diff.gen_source.none(),
      })
    end,
  },
}
