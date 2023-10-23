local prettier = require('prettier')

prettier.setup({
  bin = 'prettierd',
  filetypes = {
    "css",
    "html",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "json",
    "python",
    "scss"
  }
})
