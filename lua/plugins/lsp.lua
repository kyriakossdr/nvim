return {
  {"neovim/nvim-lspconfig"},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v4.x',
    config = function()
      local lsp_attach = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
      end

      local lsp_zero = require("lsp-zero")

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "eslint",
          "html",
          "pyright",
          "clangd",
          "dockerls",
          "cssls",
          "tailwindcss",
          "docker_compose_language_service"
        },
        handlers = {
          lsp_zero.default_setup
        }
      })


    end
  }
}
