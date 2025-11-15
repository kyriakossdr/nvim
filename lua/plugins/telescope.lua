return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup{
      defaults = {
        file_ignore_patterns = {
          "node_modules",
          "venv",
          "%.venv",
          "%.git",
          "__pycache__"
        },
        hidden = true,
        path_display = {
          "filename_first",
        }
      }
    }

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<C-p>ff', builtin.git_files, {})
  end
}

