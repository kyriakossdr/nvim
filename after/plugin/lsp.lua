local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "pyright", "clangd", "eslint", "tsserver", "lua_ls", "html", "cssls", "tailwindcss", "jsonls",
    "dockerls", "docker_compose_language_service" },
  automatic_installation = true,
  handlers = {
    lsp_zero.default_setup
  }
})

