return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        -- Monochrome palette based on your Kitty config
        colors.bg = "#0a0a0a"
        colors.bg_dark = "#0a0a0a"
        colors.bg_float = "#1a1a1a"
        colors.bg_highlight = "#2a2a2a"
        colors.bg_popup = "#1a1a1a"
        colors.bg_search = "#444444"
        colors.bg_sidebar = "#0a0a0a"
        colors.bg_statusline = "#0a0a0a"
        colors.bg_visual = "#444444"
        
        colors.fg = "#dcdcdc"
        colors.fg_dark = "#bfbfbf"
        colors.fg_float = "#dcdcdc"
        colors.fg_gutter = "#606060"
        colors.fg_sidebar = "#bfbfbf"
        
        colors.border = "#444444"
        colors.comment = "#888888"
        colors.dark3 = "#606060"
        colors.dark5 = "#888888"
        
        colors.terminal_black = "#1a1a1a"
        colors.black = "#1a1a1a"
        colors.red = "#888888"
        colors.green = "#a0a0a0"
        colors.yellow = "#b0b0b0"
        colors.blue = "#888888"
        colors.magenta = "#999999"
        colors.cyan = "#a0a0a0"
        colors.white = "#dcdcdc"
        
        colors.git = {
          add = "#a0a0a0",
          change = "#888888",
          delete = "#606060",
        }
      end,
      on_highlights = function(hl, c)
        hl.Normal = { bg = "none" }
        hl.NormalFloat = { bg = "none" }
        hl.FloatBorder = { fg = "#444444", bg = "none" }
        hl.SignColumn = { bg = "none" }
        hl.ColorColumn = { bg = "none" }
        hl.Folded = { bg = "none" }
        hl.FoldColumn = { bg = "none" }
        hl.CursorLine = { bg = "none" }
        hl.CursorColumn = { bg = "none" }
        hl.VertSplit = { fg = "#444444", bg = "none" }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
  end
}

