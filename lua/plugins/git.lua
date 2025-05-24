return {
  {
    "NeogitOrg/neogit",
    config = function ()
      require('neogit').setup({})
    end,
    dependencies = {
       "nvim-lua/plenary.nvim",         -- required
       "sindrets/diffview.nvim",        -- optional - Diff integration

       -- Only one of these is needed.
       "nvim-telescope/telescope.nvim", -- optional
    },
  },
  {
    "lewis6991/gitsigns.nvim",
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
}
