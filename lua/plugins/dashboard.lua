return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        shortcut = {},

        week_header = {
         enable = true,
        },

        project = { enable = true, limit = 5, label = ' Recently Projects:', action = 'Telescope find_files cwd=' },

        mru = { enable = true, limit =  10, label = ' Most Recent Files:', cwd_only = false},

        footer = {}
      },
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}

