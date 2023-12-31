local ts = require('nvim-treesitter.configs')

ts.setup {
  ensure_installed = {"cpp", "javascript", "typescript", "tsx", "markdown", "python", "css", "json", "html", "go", "c", "lua", "vim", "vimdoc", "query" },

  sync_install = false,

  auto_install = true,

  indent = {
    enable = true,
  },

  autotag = {
    enable = true
  },

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
