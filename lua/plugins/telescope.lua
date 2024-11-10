return {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
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
        }
      }
    }

    local builtin = require("telescope.builtin")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>ff', builtin.git_files, {})
  end
}
