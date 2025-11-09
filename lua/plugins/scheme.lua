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
        
        -- Oh-lucy inspired syntax highlighting
        hl.Comment = { fg = "#6e6b69", italic = true }
        hl.Constant = { fg = "#e06c75" }
        hl.String = { fg = "#d19a66" }
        hl.Character = { fg = "#d19a66" }
        hl.Number = { fg = "#d19a66" }
        hl.Boolean = { fg = "#d19a66" }
        hl.Float = { fg = "#d19a66" }
        hl.Identifier = { fg = "#dcdcdc" }
        hl.Function = { fg = "#61afef" }
        hl.Statement = { fg = "#c678dd" }
        hl.Conditional = { fg = "#c678dd" }
        hl.Repeat = { fg = "#c678dd" }
        hl.Label = { fg = "#c678dd" }
        hl.Operator = { fg = "#56b6c2" }
        hl.Keyword = { fg = "#c678dd" }
        hl.Exception = { fg = "#c678dd" }
        hl.PreProc = { fg = "#e06c75" }
        hl.Include = { fg = "#e06c75" }
        hl.Define = { fg = "#c678dd" }
        hl.Macro = { fg = "#c678dd" }
        hl.PreCondit = { fg = "#c678dd" }
        hl.Type = { fg = "#e5c07b" }
        hl.StorageClass = { fg = "#e5c07b" }
        hl.Structure = { fg = "#e5c07b" }
        hl.Typedef = { fg = "#e5c07b" }
        hl.Special = { fg = "#56b6c2" }
        hl.SpecialChar = { fg = "#d19a66" }
        hl.Tag = { fg = "#e06c75" }
        hl.Delimiter = { fg = "#dcdcdc" }
        hl.SpecialComment = { fg = "#6e6b69" }
        hl.Debug = { fg = "#e06c75" }
      end,
    })
    vim.cmd([[colorscheme tokyonight]])
    
    -- Set terminal colors to match monochrome palette
    vim.g.terminal_color_0 = "#1a1a1a"
    vim.g.terminal_color_1 = "#444444"
    vim.g.terminal_color_2 = "#606060"
    vim.g.terminal_color_3 = "#707070"
    vim.g.terminal_color_4 = "#888888"
    vim.g.terminal_color_5 = "#a0a0a0"
    vim.g.terminal_color_6 = "#bfbfbf"
    vim.g.terminal_color_7 = "#dcdcdc"
    vim.g.terminal_color_8 = "#2a2a2a"
    vim.g.terminal_color_9 = "#4d4d4d"
    vim.g.terminal_color_10 = "#666666"
    vim.g.terminal_color_11 = "#777777"
    vim.g.terminal_color_12 = "#999999"
    vim.g.terminal_color_13 = "#b0b0b0"
    vim.g.terminal_color_14 = "#cccccc"
    vim.g.terminal_color_15 = "#ffffff"
  end
}


