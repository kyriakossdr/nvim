return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "right",
        width = 30,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰉖",
          default = "*",
          highlight = "NeoTreeFileIcon",
        },
        modified = {
          symbol = "[+]",
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            added = "✚",
            deleted = "✖",
            modified = "✱",
            renamed = "󰁕",
            untracked = "?",
            ignored = "◌",
            unstaged = "U",
            staged = "S",
            conflict = "C",
          },
        },
      },
      filesystem = {
        filtered_items = {
          visible = false,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
        follow_current_file = {
          enabled = true,
        },
        use_libuv_file_watcher = true,
      },
    })
    vim.keymap.set('n', '<leader>e', ':Neotree toggle right<CR>', { desc = 'Toggle Neo-tree' })
    vim.keymap.set('n', '<leader>o', ':Neotree focus<CR>', { desc = 'Focus Neo-tree' })
  end
}
