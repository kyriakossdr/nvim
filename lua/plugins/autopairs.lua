return {
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup({
      disable_filetype = { "TelescopePrompt", "vim" },
      map_cr = true
    })
  end
}
