vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --fuzzyfinder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  --colorscheme
  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  })

  --treesitter
  use( 'nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})

  --lsp
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
		  -- Autocompletion
      {'onsails/lspkind-nvim'},
      {'L3MON4D3/LuaSnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/nvim-cmp'},
	  }
  }

  --primeagen's harpoon
  use('theprimeagen/harpoon')

  --auto closing tags
  use('windwp/nvim-ts-autotag')
  --auto closing brackets
  use('windwp/nvim-autopairs')
  --status line
  use('nvim-lualine/lualine.nvim')

  end)
