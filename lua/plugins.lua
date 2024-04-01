local prompts = {
	-- Code-related prompts
	Explain = "Please explain how the following code works.",
	Review = "Please review the following code and provide suggestions for improvement.",
	Tests = "Please explain how the selected code works, then generate unit tests for it.",
	Refactor = "Please refactor the following code to improve its clarity and readability.",
	FixCode = "Please fix the following code to make it work as intended.",
	Documentation = "Please provide documentation for the following code.",
	SwaggerApiDocs = "Please provide documentation for the following API using Swagger.",
	SwaggerJsDocs = "Please write JSDoc for the following API using Swagger.",
	-- Text-related prompts
	Summarize = "Please summarize the following text.",
	Spelling = "Please correct any grammar and spelling errors in the following text.",
	Wording = "Please improve the grammar and wording of the following text.",
	Concise = "Please rewrite the following text to make it more concise.",
}
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "
local plugins = {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },
			{ "hrsh7th/cmp-cmdline" },
			{ "f3fora/cmp-spell" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{ "zbirenbaum/copilot.lua", branch = "feat-copilot-proxy" },
	{
		"zbirenbaum/copilot-cmp",
		dependencies = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup({
				suggestion = {
					enable = false,
				},
				panel = {
					enable = false,
				},
			})
		end,
	},

	-- 代码段提示
	-- Lua
	{
		"nvim-treesitter/nvim-treesitter",
		-- build = ':TSUpdate'
	},
	{ "nvim-treesitter/nvim-treesitter-textobjects" },
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- lazyional, for file icons
		},
	},
	-- {
	-- 	"liangxianzhe/floating-input.nvim",
	-- },
	{
		"nvimdev/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},

	{ "nvim-telescope/telescope-fzy-native.nvim" },
	{ "goolord/alpha-nvim" },
	-- {
	-- 	"nvimdev/dashboard-nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("dashboard").setup({
	-- 			-- config
	-- 		})
	-- 	end,
	-- 	dependencies = { { "nvim-tree/nvim-web-devicons" } },
	-- },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	-- { 'nvim-telescope/telescope-fzy-native.nvim' }
	{ "akinsho/toggleterm.nvim", version = "v2.*" },
	{ "akinsho/bufferline.nvim", version = "v2.*" },
	{
		"nvim-lualine/lualine.nvim",
	},
	-- indent缩进线
	"lukas-reineke/indent-blankline.nvim",
	-- Lua
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{ "mhartington/formatter.nvim" },
	{ "nvim-lua/lsp-status.nvim" },
	-- Lua
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			})
		end,
	},
	--  {'rcarriga/nvim-notify'}
	{
		"dnlhc/glance.nvim",
		config = function()
			require("glance").setup({
				-- your configuration
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		-- version = 'release' -- To  the latest release (do not use this if you build Neovim nightly or dev builds!)
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	-- Lua
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{
		"rcarriga/nvim-notify",
		config = function()
			require("notify").setup({
				sversiones = "fade_in_slide_out",
				background_colour = "FloatShadow",
				timeout = 3000,
			})
			vim.notify = require("notify")
		end,
	},
	{ "wfxr/minimap.vim" },
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require("illuminate").configure({
				-- providers: provider d to get references in the buffer, ordered by priority
				providers = {
					"lsp",
					"treesitter",
					"regex",
				},
			})
			vim.g.Illuminate_delay = 300
			--force to change highlight color
			---- change the highlight style
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorLine" })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorLine" })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorLine" })
			-- vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
			-- vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
		end,
	},
	"f-person/auto-dark-mode.nvim",
	"renerocksai/calendar-vim",
	"nvim-lua/plenary.nvim",
	{
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	"junegunn/vim-easy-align",
	"godlygeek/tabular",
	"elzr/vim-json",
	"plasticboy/vim-markdown",
	"wookayin/vim-typora",
	-- "   'chrisbra/csv.vim',
	"honza/vim-snippets",
	"Jorengarenar/vim-syntaxMarkerFold",
	-- 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'},
	"gruvbox-community/gruvbox",
	"arcticicestudio/nord-vim",
	-- 'rmehri01/onenord.nvim', { 'branch': 'main' },
	"tpope/vim-surround",
	"jremmen/vim-ripgrep",
	"mbbill/undotree",
	-- 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']},
	-- "jiangmiao/auto-pairs",
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		config = function()
			require("nvim-autopairs").setup({
				fast_wrap = {
					map = "<C-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					before_key = "h",
					after_key = "l",
					cursor_pos_before = true,
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					manual_position = true,
					highlight = "Search",
					highlight_grey = "Comment",
				},
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				routes = {
					{
						view = "notify",
						filter = { event = "msg_showmode" },
					},
				},
				sections = {
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
				},
				views = {
					cmdline_popup = {
						filter_options = {},
						win_options = {
							winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
						},
						position = {
							row = "20%",
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
				},
				documentation = {
					view = "popup",
					---@type NoiceViewOptions
					opts = {
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						win_options = { concealcursor = "n", conceallevel = 3 },
					},
				},
				-- you can enable a preset for easier configuration
				lsp = {
					hover = {
						enabled = false,
					},
					signature = {
						enabled = true,
						view = "hover",
						opts = {
							relative = "cursor",
							border = { style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" } },
							position = {
								row = 3,
								col = 0,
							},
						},
					},
					message = {
						enabled = true,
					},
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				presets = {
					bottom_search = true,
					command_palette = true,
					long_message_to_split = true,
					inc_rename = true,
					lsp_doc_border = true,
				},
			})
			vim.opt.showmode = false
		end,
	},
	"zenbro/mirror.vim",
	"dhruvasagar/vim-table-mode",
	"lyokha/vim-xkbswitch",
	"tpope/vim-repeat",
	{
		"vim-test/vim-test",
		dependencies = {
			"preservim/vimux",
		},
		config = function()
			vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true }, { desc = "Test nearest" })
			vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { silent = true }, { desc = "Test file" })
			vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { silent = true }, { desc = "Test suite" })
			vim.keymap.set("n", "<leader>lt", ":TestLast<CR>", { silent = true }, { desc = "Test last" })
			vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { silent = true }, { desc = "Test visit" })
			vim.cmd("let test#strategy = 'vimux'")
			vim.cmd("let test#python#runner = 'pytest'")
			vim.cmd("let test#python#pytest#file_pattern = '.py'")
		end,
	},

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})
			vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary", -- Use the canary branch if you want to test the latest features but it might be unstable
		-- Do not use branch and version together, either use branch or version
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			question_header = "## User ",
			answer_header = "## Copilot ",
			error_header = "## Error ",
			separator = " ", -- Separator to use in chat
			prompts = prompts,
			auto_follow_cursor = false, -- Don't follow the cursor after getting response
			auto_insert_mode = true,
			show_help = true, -- Show help in virtual text, set to true if that's 1st time using Copilot Chat
			mappings = {
				reset = {
					normal = "<leader>L",
					insert = "<C-l>",
				},
			},
			window = {
				layout = "vertical", -- 'vertical', 'horizontal', 'float'
				-- Options below only apply to floating windows
				relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
				border = "rounded", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
				width = 0.8, -- fractional width of parent
				height = 0.6, -- fractional height of parent
				row = nil, -- row position of the window, default is centered
				col = nil, -- column position of the window, default is centered
				title = "Copilot Chat", -- title of chat window
				footer = nil, -- footer of chat window
				zindex = 1, -- determines if window is on top or below other floating windows
			},
		},
		config = function(_, opts)
			local chat = require("CopilotChat")
			local select = require("CopilotChat.select")
			-- Use unnamed register for the selection
			opts.selection = select.unnamed

			-- Override the git prompts message
			opts.prompts.Commit = {
				prompt = "Write commit message for the change with commitizen convention",
				selection = select.gitdiff,
			}
			opts.prompts.CommitStaged = {
				prompt = "Write commit message for the change with commitizen convention",
				selection = function(source)
					return select.gitdiff(source, true)
				end,
			}

			chat.setup(opts)

			vim.api.nvim_create_user_command("CopilotChatVisual", function(args)
				chat.ask(args.args, { selection = select.visual })
			end, { nargs = "*", range = true })

			-- Inline chat with Copilot
			vim.api.nvim_create_user_command("CopilotChatInline", function(args)
				chat.ask(args.args, {
					selection = select.visual,
					window = {
						layout = "float",
						relative = "cursor",
						width = 1,
						height = 0.4,
						row = 1,
					},
				})
			end, { nargs = "*", range = true })

			-- Restore CopilotChatBuffer
			vim.api.nvim_create_user_command("CopilotChatBuffer", function(args)
				chat.ask(args.args, { selection = select.buffer })
			end, { nargs = "*", range = true })

			-- Custom buffer for CopilotChat
			vim.api.nvim_create_autocmd("BufEnter", {
				pattern = "copilot-*",
				callback = function()
					vim.opt_local.relativenumber = true
					vim.opt_local.number = true

					-- Get current filetype and set it to markdown if the current filetype is copilot-chat
					local ft = vim.bo.filetype
					-- if ft == "copilot-chat" then
					-- 	-- vim.bo.filetype = "markdown"
					-- end
				end,
			})

			-- Add which-key mappings
			local wk = require("which-key")
			wk.register({
				g = {
					m = {
						name = "+Copilot Chat",
						d = "Show diff",
						p = "System prompt",
						s = "Show selection",
						y = "Yank diff",
					},
				},
			})
		end,
		event = "VeryLazy",
		keys = {
			-- Show help actions with telescope
			{
				"<leader>ah",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.help_actions())
				end,
				desc = "CopilotChat - Help actions",
			},
			-- Show prompts actions with telescope
			{
				"<leader>ap",
				function()
					local actions = require("CopilotChat.actions")
					require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
				end,
				desc = "CopilotChat - Prompt actions",
			},
			{
				"<leader>ap",
				":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
				mode = "x",
				desc = "CopilotChat - Prompt actions",
			},
			-- Code related commands
			{ "<leader>ae", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>at", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
			{ "<leader>ar", "<cmd>CopilotChatReview<cr>", desc = "CopilotChat - Review code" },
			{ "<leader>aR", "<cmd>CopilotChatRefactor<cr>", desc = "CopilotChat - Refactor code" },
			{ "<leader>an", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Naming" },
			-- Chat with Copilot in visual mode
			{
				"<leader>av",
				":CopilotChatVisual",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ax",
				":CopilotChatInline<cr>",
				mode = "x",
				desc = "CopilotChat - Inline chat",
			},
			-- Custom input for CopilotChat
			{
				"<leader>ai",
				function()
					vim.ui.input({ prompt = "Ask Copilot: " }, function(input)
						if input ~= "" then
							vim.cmd("CopilotChatBuffer " .. input)
						end
					end)
				end,
				desc = "CopilotChat - Ask input",
			},
			-- Generate commit message based on the git diff
			{
				"<leader>am",
				"<cmd>CopilotChatCommit<cr>",
				desc = "CopilotChat - Generate commit message for all changes",
			},
			{
				"<leader>aM",
				"<cmd>CopilotChatCommitStaged<cr>",
				desc = "CopilotChat - Generate commit message for staged changes",
			},
			-- Quick chat with Copilot
			{
				"<leader>aq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						vim.cmd("CopilotChatBuffer " .. input)
					end
				end,
				desc = "CopilotChat - Quick chat",
			},
			-- Debug
			{ "<leader>ad", "<cmd>CopilotChatDebugInfo<cr>", desc = "CopilotChat - Debug Info" },
			-- Fix the issue with diagnostic
			{ "<leader>af", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
			-- Clear buffer and chat history
			{ "<leader>al", "<cmd>CopilotChatReset<cr>", desc = "CopilotChat - Clear buffer and chat history" },
			-- Toggle Copilot Chat Vsplit
			{ "<leader>av", "<cmd>CopilotChatToggle<cr>", desc = "CopilotChat - Toggle" },
		},
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			vim.keymap.set(
				"n",
				"<leader>db",
				"<cmd>DapToggleBreakpoint<CR>",
				{ silent = true },
				{ desc = "Toggle breakpoint" }
			)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = { "python" },
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(path)
			vim.keymap.set(
				"n",
				"<leader>dpr",
				"<cmd>lua require'dap-python'.test_method()<cr>",
				{ noremap = true, silent = true },
				{ desc = "Run test method" }
			)
		end,
	},
	-- This plugin
	{
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim" },
		opts = {},
	},
	{ -- The task runner we use
		"stevearc/overseer.nvim",
		commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 25,
				max_height = 25,
				default_detail = 1,
			},
		},
	},
	{
		"geg2102/nvim-python-repl",
		dependencies = "nvim-treesitter",
		ft = { "python", "lua", "scala" },
		config = function()
			require("nvim-python-repl").setup({
				execute_on_send = true,
			})
			vim.keymap.set("n", "<leader>ru", function()
				require("nvim-python-repl").send_statement_definition()
			end, { desc = "Send semantic unit to REPL" })

			vim.keymap.set("v", "<leader>rv", function()
				require("nvim-python-repl").send_visual_to_repl()
			end, { desc = "Send visual selection to REPL" })

			vim.keymap.set("n", "<leader>rb", function()
				require("nvim-python-repl").send_buffer_to_repl()
			end, { desc = "Send entire buffer to REPL" })

			vim.keymap.set("n", "<leade>rxx", function()
				require("nvim-python-repl").toggle_execute()
			end, { desc = "Automatically execute command in REPL after sent" })

			vim.keymap.set("n", "<leader>rh", function()
				require("nvim-python-repl").toggle_vertical()
			end, { desc = "Create REPL in vertical or horizontal split" })
		end,
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "echo $OPENAI_API_KEY",
			})
		end,
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"folke/trouble.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
}
require("lazy").setup(plugins, { ui = { border = "rounded" } })
