return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        -- create command for new_file
        vim.api.nvim_create_user_command("NewFile", function()
            local file_name = vim.fn.input("File name: ", "", "file")
            if file_name == "" then
                return
            end
            vim.cmd("edit " .. file_name)
        end, {
            complete = "file",
            nargs = "?",
        })

        -- Set header
        dashboard.section.header.val = {
            [[███╗   ███╗ ██████╗  ██████╗  ██████╗ ███████╗███████╗██████╗ ]],
            [[████╗ ████║██╔═══██╗██╔═══██╗██╔═══██╗██╔════╝██╔════╝██╔══██╗]],
            [[██╔████╔██║██║   ██║██║   ██║██║   ██║███████╗█████╗  ██████╔╝]],
            [[██║╚██╔╝██║██║   ██║██║   ██║██║   ██║╚════██║██╔══╝  ██╔══██╗]],
            [[██║ ╚═╝ ██║╚██████╔╝╚██████╔╝╚██████╔╝███████║███████╗██║  ██║]],
            [[╚═╝     ╚═╝ ╚═════╝  ╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝]],
            [[                                                              ]],
            [[                      Greeting, Morris.                       ]],
            [[   ☕☕☕☕   Grab your coffee and start coding!   ☕☕☕☕   ]],
        }

        -- Set menu
        dashboard.section.buttons.val = {
            -- use new_file function above
            dashboard.button("e", "  > New File", ":NewFile<CR>"),
            dashboard.button("f", "󰍉  > Find File", ":Telescope find_files<CR>"),
            -- dashboard.button("t", "󱩾  > Find Text", ":cd $HOME/ | Telescope live_grep<CR>"),
            dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
            -- plugins
            dashboard.button("p", "󰐱  > Plugins", ":Lazy<CR>"),
            -- update plugins
            -- dashboard.button("u", "  > Update plugins", "<cmd>lua require('lazy').sync()<CR>"),
            -- lsp server
            -- dashboard.button("l", "󱌣   > Mason", ":Mason<CR>"),
            dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
            dashboard.button("q", "󰩈  > Quit", ":qa<CR>"),
        }

        -- Set footer
        --   NOTE: This is currently a feature in my fork of alpha-nvim (opened PR #21, will update snippet if added to main)
        --   To see test this yourself, add the function as a dependecy in packer and uncomment the footer lines
        --   ```init.lua
        --   return require('packer').startup(function()
        --       use 'wbthomason/packer.nvim'
        --       use {
        --           'goolord/alpha-nvim', branch = 'feature/startify-fortune',
        --           requires = {'BlakeJC94/alpha-nvim-fortune'},
        --           config = function() require("config.alpha") end
        --       }
        --   end)
        --   ```
        -- local fortune = require("alpha.fortune")
        -- dashboard.section.footer.val = fortune()

        -- Send config to alpha
        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.wo.fillchars = "eob: "
        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local count = (math.floor(stats.startuptime * 100) / 100)
                dashboard.section.footer.val = {
                    -- github
                    [[                                               ]],
                    [[                                   󱐌 ]]
                    .. stats.count
                    .. " plugins loaded in "
                    .. count
                    .. " ms",
                    [[                                               ]],
                    [[                                               ]],
                    [[ @morris_wyc                                  @moooooser999                               Wen Yu Chang]],
                }
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
        vim.cmd([[
  autocmd VimEnter,BufEnter * if &ft == 'alpha' | set showtabline=0 | set laststatus=0 | else | set showtabline=2 | set laststatus=2 | endif
]])
    end,
}
