return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.4',
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

    -- Monochrome colors for Telescope
    vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none", fg = "#dcdcdc" })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#444444" })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none", fg = "#dcdcdc" })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none", fg = "#444444" })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "#888888", fg = "#0a0a0a" })
    vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "#888888", fg = "#0a0a0a" })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none", fg = "#444444" })
    vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "#888888", fg = "#0a0a0a" })
    vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none", fg = "#444444" })
    vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#444444", fg = "#dcdcdc" })
    vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#bfbfbf" })

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>ff', builtin.git_files, {})
  end
}


