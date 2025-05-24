return {
  {"neovim/nvim-lspconfig"},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {"glepnir/lspsaga.nvim"},
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v4.x',
    config = function()
      local lsp_attach = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false, silent = true }

        vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
        vim.keymap.set('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
        vim.keymap.set('n', 'K', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
        vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
        vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
        vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
      end

      local lsp_zero = require("lsp-zero")
      require('lspsaga').setup({
        lightbulb = {
          enable = false,
          sign = false,
          virtual_text = false,
        }
      })

      lsp_zero.extend_lspconfig({
        sign_text = true,
        lsp_attach = lsp_attach,
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      })

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "gopls",
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
