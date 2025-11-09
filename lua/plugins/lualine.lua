return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      bg = '#0a0a0a',
      fg = '#dcdcdc',
      gray = '#888888',
      light_gray = '#bfbfbf',
      dark_gray = '#444444',
    }

    local custom_theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.fg },
        b = { fg = colors.fg, bg = colors.dark_gray },
        c = { fg = colors.light_gray, bg = 'none' },
      },
      insert = {
        a = { fg = colors.bg, bg = colors.light_gray },
      },
      visual = {
        a = { fg = colors.bg, bg = colors.gray },
      },
      replace = {
        a = { fg = colors.bg, bg = colors.light_gray },
      },
      command = {
        a = { fg = colors.bg, bg = colors.light_gray },
      },
      inactive = {
        a = { fg = colors.gray, bg = 'none' },
        b = { fg = colors.gray, bg = 'none' },
        c = { fg = colors.gray, bg = 'none' },
      },
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = custom_theme,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {}
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = { {
          'filename',
          file_status = true,
          path = 0
        } },
        lualine_x = {
          { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
          hint = ' ' } },
          'encoding',
          'filetype'
        },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { {
          'filename',
          file_status = true,
          path = 0
        } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = { 'fugitive' }
    })
  end
}

