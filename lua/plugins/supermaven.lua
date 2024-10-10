return {
    "supermaven-inc/supermaven-nvim",
    config = function()
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
