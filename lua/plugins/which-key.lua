return {
    "folke/which-key.nvim",
    config = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
        require("which-key").setup({
            notify = false,
            -- your configuration comes here
            -- or leave it empty to  the default settings
            -- refer to the configuration section below
        })
    end,
}
