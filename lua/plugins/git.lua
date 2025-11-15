return {
  {
    "NeogitOrg/neogit",
    config = function ()
      require('neogit').setup({})
    end,
    dependencies = {
       "nvim-lua/plenary.nvim",         -- required
       "sindrets/diffview.nvim",        -- optional - Diff integration

       "nvim-telescope/telescope.nvim", -- optional
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = { "BufEnter" },
    config = function ()
      require('gitsigns').setup({})
    end
  },
  {
    "dinhhuy258/git.nvim",
    config = function ()
      require('git').setup({
        keymaps = {
          -- Open blame window
          blame = "<Leader>gb",
          -- Open file/folder in git repository
          browse = "<Leader>go",
        }
      })
    end
  },
  {
    'isakbm/gitgraph.nvim',
    opts = {
      git_cmd = "git",
      symbols = {
        merge_commit = 'M',
        commit = '*',
      },
      format = {
        timestamp = '%H:%M:%S %d-%m-%Y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          print('selected commit:', commit.hash)
        end,
        on_select_range_commit = function(from, to)
          print('selected range:', from.hash, to.hash)
        end,
      },
    },
    keys = {
      {
        "<leader>gl",
        function()
          require('gitgraph').draw({}, { all = true, max_count = 5000 })
        end,
        desc = "GitGraph - Draw",
      },
    },
  },
}
