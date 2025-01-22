return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v4.x",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lua",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		local lsp_attach = function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp_zero.default_keymaps({ buffer = bufnr })
		end

		lsp_zero.extend_lspconfig({
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
			lsp_attach = lsp_attach,
			float_border = "rounded",
			sign_text = {
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "",
			},
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						on_init = function(client)
							lsp_zero.nvim_lua_settings(client, {})
						end,
					})
				end,
			},
		})

		vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

		vim.diagnostic.config({
			virtual_text = false,
			severity_sort = true,
			float = {
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()
		local cmp_format = lsp_zero.cmp_format()

		require("luasnip.loaders.from_vscode").lazy_load()

		vim.opt.completeopt = { "menu", "menuone", "noselect" }
		-- super_maven = require("supermaven-nvim")

		cmp.setup({
			formatting = cmp_format,
			preselect = "item",
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "buffer", keyword_length = 3 },
				{ name = "luasnip", keyword_length = 2 },
			},
			formatting = {
				-- changing the order of fields so the icon is the first
				fields = { "menu", "abbr", "kind" },

				-- here is where the change happens
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = "λ",
						luasnip = "⋗",
						buffer = "Ω",
						path = "P",
						nvim_lua = "Π",
						copilot = "",
						spell = "S",
						-- supermaven = "",
					}
					local kind_icons = {
						Text = "󰙩",
						Method = "m",
						Function = "󰊕",
						Constructor = "",
						Field = "",
						Variable = "󰆧",
						Class = "󰌗",
						Interface = "",
						Module = "",
						Property = "",
						Unit = "",
						Value = "",
						Enum = "",
						Keyword = "",
						Snippet = "",
						Color = "",
						File = "󰈙",
						Reference = "",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "",
						Struct = "",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "",
					}

					item.menu = menu_icon[entry.source.name]
					item.kind = kind_icons[item.kind]
					return item
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- confirm completion item
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- toggle completion menu
				["<C-e>"] = cmp_action.toggle_completion(),

				-- tab complete
				["<Tab>"] = cmp_action.tab_complete(),
				["<S-Tab>"] = cmp.mapping.select_prev_item(),

				-- navigate between snippet placeholder
				["<C-d>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),

				-- scroll documentation window
				["<C-f>"] = cmp.mapping.scroll_docs(5),
				["<C-u>"] = cmp.mapping.scroll_docs(-5),
				-- Supermaven
				-- ["<C-p>"] = super_maven.accept_suggestion,
				-- ["<C-]>"] = super_maven.clear_suggestion,
				-- ["<C-q>"] = super_maven.accept_word,
				["<C-p>"] = cmp.config.disable,
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
		})
		require("supermaven-nvim").setup({
			log_level = "off",
			keymaps = {
				accept_suggestion = "<C-p>",
				clear_suggestion = "<C-]>",
				accept_word = "<C-q>",
			},
		})
	end,
}
