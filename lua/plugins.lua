return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- LSP config
	use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
}
	use "folke/lsp-colors.nvim"
	use("b0o/schemastore.nvim")
	use("folke/lua-dev.nvim")
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
	use{ 'kkharji/lspsaga.nvim' }  -- nightly
	use {
	"hrsh7th/nvim-cmp",
	requires = {
	"hrsh7th/cmp-nvim-lsp", --neovim 内置 LSP 客户端的 nvim-cmp 源
	--以下插件可选，可以根据个人喜好删减
	"onsails/lspkind-nvim", --美化自动完成提示信息
	"hrsh7th/cmp-nvim-lua", --nvim-cmp source for neovim Lua API.
	"hrsh7th/cmp-path", --自动提示硬盘上的文件
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-cmdline"

	}
	}
	use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

	-- 代码段提示
	use {
	"L3MON4D3/LuaSnip",
	requires = {
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	"rafamadriz/friendly-snippets" --代码段合集
	}
	}
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
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
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
	use {"akinsho/toggleterm.nvim", tag = 'v2.*',}
	use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	-- indent缩进线
	use "lukas-reineke/indent-blankline.nvim"

end
	)
