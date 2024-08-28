vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use { 'nvim-treesitter/nvim-treesitter' }
	use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.8',
  	requires = { {'nvim-lua/plenary.nvim'} }
	}
  use {"ellisonleao/glow.nvim", config = function() require("glow").setup({
	style = "dark"
  }) end}

	use 'jose-elias-alvarez/null-ls.nvim'

  use { 'numToStr/Comment.nvim' }
	-- use 'morhetz/gruvbox'
	use "folke/tokyonight.nvim"
	-- use ({ 'projekt0n/caret.nvim' })
	use 'mbbill/undotree'
	use 'neovim/nvim-lspconfig'  -- LSP configuration

	    -- Autocompletion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	-- Optional: Additional completion sources
	use 'hrsh7th/cmp-buffer'  -- Buffer completions
	use 'hrsh7th/cmp-path'    -- Path completions
	use 'hrsh7th/cmp-cmdline' -- Command-line completions

	use 'L3MON4D3/LuaSnip'        -- Snippet engine
  use 'rafamadriz/friendly-snippets' -- Preconfigured snippets

	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-tree/nvim-tree.lua'
	use 'tpope/vim-fugitive'
	use {
		  'HiPhish/rainbow-delimiters.nvim',
			config = function () require("rainbow-delimiters").setup({})
			end
		}
	use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

  end)

