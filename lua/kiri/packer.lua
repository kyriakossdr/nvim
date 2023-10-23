vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --fuzzyfinder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-tree/nvim-web-devicons')

  --null-ls
  use('jose-elias-alvarez/null-ls.nvim')
  --prettier
  use('MunifTanjim/prettier.nvim')

  --colorscheme
  use('Shatur/neovim-ayu')

  --markdown preview
  use {'iamcco/markdown-preview.nvim'}

  --treesitter
  use( 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  --lsp
  use {
	  'VonHeikemen/lsp-zero.nvim',  branch = 'v3.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
  --vscode-like pictograms
  use('onsails/lspkind.nvim')

  --primeagen's harpoon
  use('theprimeagen/harpoon')

  --auto closing tags (REACTTTTT)
  use('windwp/nvim-ts-autotag')
  --auto closing brackets
  use('windwp/nvim-autopairs')
  --status line
  use('nvim-lualine/lualine.nvim')

  end)
