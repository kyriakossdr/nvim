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
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {"pyright", "clangd", "tsserver", "lua_ls", "html", "cssls", "tailwindcss", "jsonls", "dockerls", "docker_compose_language_service"},
  automatic_installation = true,
  handlers = {
    lsp_zero.default_setup
  }
})
