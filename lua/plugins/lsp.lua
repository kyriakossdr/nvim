return {
  {"neovim/nvim-lspconfig"},
  {"williamboman/mason.nvim"},
  {"williamboman/mason-lspconfig.nvim"},
  {
    "glepnir/lspsaga.nvim",
    config = function()
      require('lspsaga').setup({
        ui = {
          title = true
        },

        lightbulb = {
          enable = false
        }
      })
    end
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = 'v4.x',
    config = function()
      local lsp_attach = function(_, bufnr)
        local opts = { buffer = bufnr, remap = false, silent = true }

        vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
        vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
        vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
        vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
        vim.keymap.set('n', 'gf', '<Cmd>Lspsaga finder<CR>', opts)
        vim.keymap.set('n', '<leader>d', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)

        vim.keymap.set('n', 'gi', '<Cmd>Lspsaga finder imp<CR>', opts)
        vim.keymap.set('n', '<leader>ca', '<Cmd>Lspsaga code_action<CR>', opts)
        vim.keymap.set('n', '<leader>o', '<Cmd>Lspsaga outline<CR>', opts)
        vim.keymap.set('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
        vim.keymap.set('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)

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
          "gopls",
          "lua_ls",
          "eslint",
          "html",
          "pyright",
          "clangd",
          "dockerls",
          "cssls",
          "tailwindcss",
          "ts_ls",
          "docker_compose_language_service"
        },
        handlers = {
          lsp_zero.default_setup
        }
      })


    end
  }
}
