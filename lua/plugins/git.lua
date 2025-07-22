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
    config = function ()
      require('gitsigns').setup({
          signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
          },
          signs_staged = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
            untracked    = { text = '┆' },
          },
          signs_staged_enable = true,
          signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
          numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
          linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
          word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
          watch_gitdir = {
            follow_files = true
          },
          auto_attach = true,
          attach_to_untracked = false,
          current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
          current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
            delay = 1000,
            ignore_whitespace = false,
            virt_text_priority = 100,
            use_focus = true,
          },
          current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
        })
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
