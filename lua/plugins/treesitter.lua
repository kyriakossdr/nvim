return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {"cpp", "javascript", "typescript", "tsx", "json", "markdown", "python", "css", "html", "go", "lua" },

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
