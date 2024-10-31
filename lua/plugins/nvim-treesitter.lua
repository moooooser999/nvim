return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "python",
                "html",
                "css",
                "vim",
                "lua",
                "javascript",
                "typescript",
                "tsx",
                "markdown",
                "cpp",
                "json",
                "latex",
                "bash",
                "dockerfile",
                "vimdoc",
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    node_decremental = "<BS>",
                    -- scope_incremental = '<TAB>',
                },
            },
            indent = {
                enable = true,
            },
        })
        -- 开启 Folding
        -- vim.wo.foldmethod = 'expr'
        -- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
        -- 默认不要折叠
        -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
        -- vim.wo.foldlevel = 99
        vim.api.nvim_create_augroup("cmdwin_treesitter", { clear = true })
        vim.api.nvim_create_autocmd("CmdwinEnter", {
            pattern = "*",
            command = "TSBufDisable incremental_selection",
            group = "cmdwin_treesitter",
            desc = "Disable treesitter's incremental selection in Command-line window",
        })
    end,
}
