require('auto-dark-mode').setup {
	update_interval = 1000,
	set_dark_mode = function()
		-- vim.api.nvim_set_option('background', 'dark')
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "MinimapCurrentLine", { ctermfg="Green", fg="#50FA7B", bg="#32302f" })
        -- set the illuminate color to lighter gray
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#3c3836" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#3c3836" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#3c3836" })
        -- set cursorline to a darker gray
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#282828" })

	end,
	set_light_mode = function()
		require('plugins-config.onenord')
		vim.api.nvim_set_option('background', 'light')
		vim.cmd('colorscheme catppuccin-latte')
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "MinimapCurrentLine", { ctermfg="Green", fg="#50FA7B", bg="#32302f" })
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#f0f0f0" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#f0f0f0" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#f0f0f0" })

	end,
	}
require('auto-dark-mode').init()
