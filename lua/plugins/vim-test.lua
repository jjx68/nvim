return {
    'vim-test/vim-test',
    config = function()
        -- Set vim-test to use vimux as the strategy
        --vim.g["test#strategy"] = "vimux"
        --vim.g["test#strategy"] = "kitty"
        vim.g["test#strategy"] = "neovim"
        --vim.g["test#custom_strategies"] = {
        --    terminal = function(cmd)
        --        -- Launch a new terminal instance with Kitty
        --        os.execute("kitty sh -c '" .. cmd .. "; exec zsh'")
        --    end
        --}

        -- Set the strategy
        --vim.g["test#strategy"] = "terminal"
    end
}
