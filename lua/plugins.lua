return require('packer').startup(function(use)
    -- LSP
    use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional
    {'f3fora/cmp-spell'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}
    --Copilot
    use { "zbirenbaum/copilot.lua" }
    use {
  "zbirenbaum/copilot-cmp",
  after = { "copilot.lua" },
  config = function ()
    require("copilot_cmp").setup{method = "getPanelCompletions",}
            
  end
}

	use 'wbthomason/packer.nvim'
	-- LSP config
	use {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
	  respect_buf_cwd = true,
	  update_cwd = true,
	  update_focused_file = {
		  enable = true,
		  update_cwd = true}
    }end}
	-- 基于neovim 内置lsp 的轻量级lsp 插件，具有高性能UI。非常酷
	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

	-- 代码段提示
	-- Lua
	use {
	  "folke/todo-comments.nvim",
	  requires = "nvim-lua/plenary.nvim",
	  config = function()
		require("todo-comments").setup()
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		
	  end
	}
     use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
	use {
	  'kyazdani42/nvim-tree.lua',requires = {'kyazdani42/nvim-web-devicons', -- optional, for file icons
	},
	  tag = 'nightly', -- optional, updated every week. (see issue #1193)
	  require('nvim-tree').setup()
	}
	use {
    'goolord/alpha-nvim',}
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
	  'nvim-telescope/telescope.nvim',
	  requires = { {'nvim-lua/plenary.nvim'}}
}
	--use { 'nvim-telescope/telescope-fzy-native.nvim' }
	use {"akinsho/toggleterm.nvim", tag = 'v2.*',}
	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- indent缩进线
	use "lukas-reineke/indent-blankline.nvim"
		-- Lua
	use {
	  "folke/zen-mode.nvim",
	  config = function()
		require("zen-mode").setup {
		  -- your configuration comes here
		  -- or leave it empty to use the default settings
		  -- refer to the configuration section below
		}
	  end
	}
    use { 'mhartington/formatter.nvim' }
    use {'nvim-lua/lsp-status.nvim'}
    -- Lua
    use {
      "folke/trouble.nvim",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
    use {'rcarriga/nvim-notify'}
    use({
  "dnlhc/glance.nvim",
  config = function()
    require('glance').setup({
      -- your configuration
    })
  end,
})
    use {
  'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
}
    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

end
	)
