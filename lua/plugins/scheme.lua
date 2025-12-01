return {
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function ()
      require("onedarkpro").setup({
        plugins = {
          gitsigns = true,
          nvim_cmp = true,
          nvim_lsp = true,
          nvim_notify = true,
          neo_tree = true,
          lsp_saga = true,
          telescope = true,
          treesitter = true,
        },
        --options = {
        --  transparency = true,
        --  lualine_transparency = true,
        --}
      })

      vim.cmd("colorscheme onedark_dark")
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("onedarkpro").setup({
        plugins = {
          gitsigns = true,
          nvim_cmp = true,
          nvim_lsp = true,
          nvim_notify = true,
          neo_tree = true,
          lsp_saga = true,
          telescope = true,
          treesitter = true,
        },
        --options = {
        --  transparency = true,
        --  lualine_transparency = true,
        --}
      })
    end
  },
}
