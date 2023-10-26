local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  lsp_zero.format_on_save({
    format_opts = {
      async = false,
      timeout_ms = 10000,
    },
    servers = {
      ['tsserver'] = {'javascript', 'typescript', 'tsx'},
      ['lua_ls'] = {'lua'},
      ['html'] = {'html'},
      ['clangd'] = {'cpp'},
      ['cssls'] = {'css'},
      ['jsonls'] = {'json'}
    }
  })

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"pyright", "clangd", "tsserver", "lua_ls", "html", "cssls", "tailwindcss", "jsonls", "dockerls", "docker_compose_language_service"},
  automatic_installation = true,
  handlers = {
    lsp_zero.default_setup
  }
})
