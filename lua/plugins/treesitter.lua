return {
  {
    "nvim-treesitter/nvim-treesitter",
    depedencies = {
      "windwp/nvim-ts-autotag",
      opts = {
        autotag = {
          enable = true,
        },
      }
    },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {"cpp", "javascript", "typescript", "tsx", "markdown", "python", "css", "html", "go", "lua" },

        sync_install = false,

        auto_install = true,

        indent = {
          enable = true,
        },

        highlight = {
          enable = true,

          additional_vim_regex_highlighting = false,
        },
      })
    end
  },
}
